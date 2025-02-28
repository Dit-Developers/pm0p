# pm0p.dart - Port Scanner
```bash
                     ____      
    ____  ____ ___  / __ \____ 
   / __ \/ __ `__ \/ / / / __ \
  / /_/ / / / / / / /_/ / /_/ /
 / .___/_/ /_/ /_/\____/ .___/ 
/_/                   /_/      
                https://msuport.vercel.app/
```
A Dart-based port scanner that detects open ports on a target system.

## Repository
[GitHub: Dit-Developers/pm0p](https://github.com/Dit-Developers/pm0p/)

## Features
- Scans for open ports on a given target.
- Fetches a list of ports from online sources.
- Uses asynchronous operations for faster scanning.

## Prerequisites
- Dart SDK installed
- Internet connection for fetching the port lists

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/Dit-Developers/pm0p.git
   cd pm0p
   ```
2. Install dependencies (if needed):
   ```sh
   dart pub get
   ```

## Usage
Run the scanner using Dart:
```sh
  dart pm0p.dart <target>
```
Example:
```sh
  dart pm0p.dart 192.168.1.1
  dart pm0p.dart https://google.com/
```

## Code Overview
The script performs the following tasks:
1. **Fetch Port List** - Retrieves TCP and UDP port lists from GitHub.
2. **Scan Ports** - Iterates through the fetched ports and attempts to connect.
3. **Display Results** - Outputs open ports found during the scan.

## Disclaimer
This tool is for educational and security testing purposes only. Unauthorized scanning of systems without permission is illegal. Use responsibly.

## License
MIT License

## Author
Muhammad Sudais Usmani

