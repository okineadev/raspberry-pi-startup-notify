# Raspberry Pi Startup Notifier 🚀🍓

This simple script(s) sends a Telegram message notification whenever your Raspberry Pi starts up.

## ✨ Features

- ✅ Sends a message via Telegram Bot when the Raspberry Pi starts
- 🕒 Includes current startup time
- 🌡️ Reports the CPU temperature

## 📁 Project Structure

```plaintext
raspberry-pi-startup-notify/
├── config.sh                    # 🔐 Telegram Bot Token & Chat ID go here
├── notify-about-startup.sh      # Main script to send the notification
├── startup.service              # Systemd unit file to enable the script on boot
└── tg_bot_api.sh                # Loads send function and Telegram bot token
```

## ⚙️ Setup

### 1. 📥 Clone the repository

```bash
git clone https://github.com/okineadev/raspberry-pi-startup-notify.git --depth=1
```

### 2. 🔐 Fill `config.sh`

Fill `raspberry-pi-startup-notify/config.sh` with the necessary credentials

### 3. ✅ Set up the systemd service

Change `<username>` fields to your username in the `startup.service` file:

```bash
sed -i "s/<username>/$(whoami)$/g" raspberry-pi-startup-notify/startup.service
# Or manually edit the file:
nano raspberry-pi-startup-notify/startup.service
```

Copy `startup.service` to your systemd directory:

```bash
sudo cp raspberry-pi-startup-notify/startup.service /etc/systemd/system/
```

Enable it to run on boot:

```bash
sudo systemctl daemon-reload
sudo systemctl enable startup.service
```

You can test it without rebooting:

```bash
sudo systemctl start startup.service
```

## 💬 Example Message

> _Raspberry Pi started!_
>
> • `Time: 2025-04-19 09:42:00`
> • `CPU Temp: 51.7°C`

## 🛠️ Requirements

- A Raspberry Pi (or any Linux device)
- `curl`
- `vcgencmd` (comes with `raspi-config`)

## 👨‍💻 Credits

Created with ❤️ by [okineadev](https://github.com/okineadev)

Feel free to fork & contribute!
