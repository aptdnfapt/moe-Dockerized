#!/bin/bash
set -e

# Define the Docker image name and container name
IMAGE_NAME="moe-bot"
CONTAINER_NAME="moe_container"
MOEDIR=$(cd "$(dirname "${0}")" &>/dev/null && pwd)
DOTENV="${MOEDIR}/.env"

# Create the .env file if it doesn't exist
if [ ! -f "${DOTENV}" ]; then
  echo "Creating .env file in ${DOTENV}"
  touch "${DOTENV}"
  chmod 600 "${DOTENV}"

  echo "# moe's variables" >>"${DOTENV}"
  echo "CMD_PREFIX=m1" >>"${DOTENV}"

  read -s -p "Enter Discord Auth Token: " TOKEN
  echo -e "\n# Discord Auth Token\nAUTH_TOKEN=${TOKEN}" >>"${DOTENV}"
  unset TOKEN

  while true; do
    echo
    read -p "Enable Emoji Reactions? (y/n): " yn
    case "$yn" in
    [Yy]*)
      cat <<EOF >>"${DOTENV}"
# Reaction Emojis
UPVOTE_EMOJI=
DOWNVOTE_EMOJI=
NOYOU_EMOJI=
MOE_EMOJI=
THINK_EMOJI=
WOW_EMOJI=
EOF
      break
      ;;
    [Nn]*)
      # Assuming cogs directory is at the same level as install.dock.sh
      if [ -f "${MOEDIR}/cogs/react.py" ]; then
        mv "${MOEDIR}/cogs/react.py" "${MOEDIR}/cogs/react_py"
        echo "Disabled react.py!"
      else
        echo "Warning: cogs/react.py not found, skipping rename."
      fi
      break
      ;;
    *) echo "Please type 'y' or 'n'." ;;
    esac
  done
fi

echo "Checking for existing container: ${CONTAINER_NAME}"
if docker inspect "${CONTAINER_NAME}" &>/dev/null; then
  echo "Container ${CONTAINER_NAME} found. Stopping and removing..."
  docker stop "${CONTAINER_NAME}"
  docker rm "${CONTAINER_NAME}"
fi

# Build the Docker image
echo "Building Docker image: ${IMAGE_NAME}"
docker build -t "${IMAGE_NAME}" .

# Run the Docker container, mounting the current directory
echo "Running Docker container: ${IMAGE_NAME}"
docker run -d \
  --name "${CONTAINER_NAME}" \
  --restart always \
  -v "${MOEDIR}":/app \
  "${IMAGE_NAME}"

echo "Moe bot container is running in the background."
echo "To stop the container, run: docker stop ${CONTAINER_NAME}"
echo "To view container logs, run: docker logs ${CONTAINER_NAME}"
