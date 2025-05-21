# Use a lightweight Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file (if you have one, otherwise list dependencies directly)
# Assuming dependencies are listed in the install.sh script for now.
# If you have a requirements.txt, uncomment the following lines:
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# Copy the bot's code and other necessary files
COPY . /app

# Install Python dependencies (listing them directly as per install.sh)
RUN pip install --no-cache-dir discord.py transformers torch py-dotenv wheel

# Command to run the bot
CMD ["python", "bot.py"]
