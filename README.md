# møe - Dockerized

A Discord chatbot equipped with DialoGTP; a pre-trained language model tailored for casual conversation, designed to be easily deployed using Docker.

<img decoding="async" loading="lazy" alt="moe banner red and white pixelated letters" src="https://raw.githubusercontent.com/monk-afk/moe/main/images/moe_banner_v3_680x240.png"  width="340"/>

møe's official home is at the SquareOne Discord:

[![](https://dcbadge.limes.pink/api/server/pE4Tu3cf23)](https://discord.gg/pE4Tu3cf23)

___

## Features

- Casual Conversational AI Language Model, Powered by [DialoGPT, courtesy of Huggingface](https://huggingface.co/docs/transformers/main/en/model_doc/dialogpt) - [docs](https://huggingface.co/docs/transformers/v4.49.0/en/main_classes/text_generation#transformers.GenerationConfig)

- Response triggers: "moe", "bot", "monk", "molo"

- Designated Reply-to Channel allows møe to reply freely with guild Members

- Always-reply-to enables møe to always respond to specified Users in any channel

___

## Installation (using Docker)

This guide explains how to install and run møe using Docker on both Linux and Windows.

### Prerequisites

Ensure you have the following installed on your system:

#### Git

- **Linux (Debian/Ubuntu):**
  ```bash
  sudo apt update
  sudo apt install git -y
  ```
- **Linux (Fedora):**
  ```bash
  sudo dnf install git -y
  ```
- **Linux (Arch Linux):**
  ```bash
  sudo pacman -S git
  ```
- **Windows:** Download and run the installer from [git-scm.com](https://git-scm.com/download/win).

#### Docker

- **Linux:** Follow the official installation guide for your distribution: [Install Docker Engine](https://docs.docker.com/engine/install/)
- **Windows:** Download and install Docker Desktop for Windows: [Install Docker Desktop on Windows](https://docs.docker.com/desktop/install/windows-install/)

### 1. Get a Discord Bot Token

Follow the official guide to create a Discord application and retrieve your bot token: [Discord Developer Portal](https://discord.com/developers/applications/)

After creating the bot, you'll need to invite it to your Discord server. You can do this by generating an OAuth2 URL. Go to your Discord application's page, navigate to "OAuth2" -> "URL Generator", select the `bot` scope, and then choose the necessary permissions for the bot (e.g., `Send Messages`, `Connect`, `Speak`, `Read Message History`, etc.). Copy the generated URL and open it in your browser to invite the bot.

### 2. Clone the Repository

Open your terminal (Linux) or PowerShell/Command Prompt (Windows) and clone this repository:

```bash
git clone https://github.com/aptdnfapt/moe-Dockerized.git
cd moe
```

### 3. Configure the Bot (.env file)

The bot uses a `.env` file for configuration. The `install.dock.sh` script will guide you through creating this file if it doesn't exist and prompt for essential information like your Discord Auth Token.

If the `.env` file already exists, you can edit it with a text editor to modify settings like the command prefix (`CMD_PREFIX`) or emoji reactions.

### 4. Run the Installation Script

Execute the `install.dock.sh` script in your terminal or PowerShell/Command Prompt. This script will build the Docker image (if not already built), create the `.env` file (if it doesn't exist and prompt for necessary info), and run the Docker container with a restart policy.

- **Linux:**
  ```bash
  chmod +x install.dock.sh
  ./install.dock.sh
  ```
- **Windows (PowerShell):**
  ```powershell
  .\install.dock.sh
  ```
- **Windows (Command Prompt):**
  ```cmd
  install.dock.sh
  ```

The script will output messages indicating the progress and confirm when the container is running in the background.

___

## Commands

The command prefix default is `m1`, as set in the .env file.

> `command`(privilege): deatils of command

- `chatlogs`(send_messages): show your conversation history
- `forgetme`(send_messages): erase møe's memory of your conversation
- `ping`(send_messages): test latency
- `help`(send_messages): list all commands
- `source`(send_messages): get the link to møe's repository
- `squareone`(send_messages): get the invite link to møe's home Discord server

- `forgetuser @mention_member`(manage_messages): erase møe's memory of the mentioned user
- `setreplychannel`(administrator): set or overwrite reply channel to focused channel
- `unsetreplychannel`(administrator): unset reply channel
- `sayhi @mention`(administrator): set reply-to user in any channel
- `saybye @mention`(administrator): remove reply-to user
- `forgetguild`(administrator): erase møe's conversation memory for the entire guild

- `rebuild`(owner): rebuild the database
- `reload [cogs name]`(owner): reload a cogs module
- `shutdown`(owner): send the shutdown signal for graceful termination
- `dumpbackend`(owner): dump the raw memory to debug.txt

___

## Removing the Bot (Docker)

To completely remove the Dockerized møe bot and its image from your system (Linux or Windows), follow these steps:

1. **Stop the Container:**
   ```bash
   docker stop moe_container
   ```

2. **Remove the Container:**
   ```bash
   docker rm moe_container
   ```

3. **Remove the Docker Image:**
   ```bash
   docker rmi moe-bot
   ```
   Note: Replace `moe-bot` with the actual image name if you changed it during the build process.

This will stop and remove the running møe container and delete the Docker image from your system. You can also remove the `moe` directory if you cloned the repository.

___

## Troubleshoot

- ToDo

___

## Credits

This project is a Dockerized fork of [møe by monk-afk](https://github.com/monk-afk/moe).

Thanks to monk-afk for the original project.

This fork is maintained by aptdnfapt: [https://github.com/aptdnfapt/moe-Dockerized.git](https://github.com/aptdnfapt/moe-Dockerized.git)

___

**[Changelog](CHANGELOG.md)**

**[Terms of Service](Terms_of_Service.md)**

**[Privacy Policy](Privacy_Policy.md)**

___

```py
######################################################################################
##  MIT License                                                                     ##
##                                                                                  ##
##  Copyright © 2024-2025 monk (Discord ID: 699370563235479624)                     ##
##                                                                                  ##
##  Permission is hereby granted, free of charge, to any person obtaining a copy    ##
##  of this software and associated documentation files (the "Software"), to deal   ##
##  in the Software without restriction, including without limitation the rights    ##
##  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell       ##
##  copies of the Software, and to permit persons to whom the Software is           ##
##  furnished to do so, subject to the following conditions:                        ##
##                                                                                  ##
##  The above copyright notice and this permission notice shall be included in all  ##
##  copies or substantial portions of the Software.                                 ##
##                                                                                  ##
##  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      ##
##  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        ##
##  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     ##
##  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          ##
##  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   ##
##  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   ##
##  SOFTWARE.                                                                       ##
######################################################################################
