# Syncthing GitHub Codespace Template

A ready-to-use GitHub Codespace template for working with Syncthing. Get a fully configured Syncthing instance running in seconds.

## Overview

This is a GitHub Codespace template that provides a pre-configured development environment for Syncthing. The dev container automatically sets up and configures Syncthing with all necessary dependencies, so you can start working immediately without any manual setup.

## Quick Start

### Using as a GitHub Codespace Template

1. Click **"Use this template"** → **"Create a new codespace"** on the repository page (or go to [Create Codespace](https://github.com/codespaces/new))
2. Wait for the Codespace to initialize (the setup script runs automatically)
3. Once ready, the Syncthing UI will open automatically at http://localhost:8384

### Using Locally with Dev Containers

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd codespace-syncthing
   ```

2. Open the repository in VS Code
3. When prompted, click **"Reopen in Container"** or use the command palette (`Ctrl+Shift+P`) and select **"Dev Containers: Reopen in Container"**
4. The dev container will start automatically and run the setup script

### What Gets Installed

- Ubuntu base image
- Syncthing package and dependencies
- Initial Syncthing configuration with:
  - UI accessible from `0.0.0.0:8384` (instead of localhost only)
  - Insecure admin access enabled for development

## Accessing Syncthing

Once the Codespace or dev container is running:

1. **Syncthing Web UI**: 
   - URL: http://localhost:8384
   - Opens automatically when the container starts
   - In Codespace, use the **Ports** tab to open the forwarded port
   
2. **Syncthing Sync Protocol**: Runs on port 22000 (for syncing files)

## Project Structure

```
.
├── .devcontainer/
│   ├── devcontainer.json          # Dev container configuration
│   └── install-syncthing.sh       # Setup and installation script
└── README.md                       # This file
```

## Dev Container Configuration

The dev container is configured with:

- **Base Image**: `mcr.microsoft.com/devcontainers/base:ubuntu`
- **Auto-start Command**: Runs `install-syncthing.sh` on container creation
- **Background Service**: Syncthing starts automatically on container start
- **Port Forwarding**:
  - Port `8384`: Syncthing Web UI
  - Port `22000`: Syncthing sync protocol

## Configuration Details

The installation script:

1. Updates system packages
2. Installs Syncthing from the official repository
3. Generates initial Syncthing configuration
4. Modifies configuration to:
   - Listen on all interfaces (`0.0.0.0:8384`) instead of localhost only
   - Enable insecure admin access for development purposes

> **⚠️ Security Note**: The insecure admin access setting is for development only. Do not use this in production environments.

## Common Tasks

### Stop Syncthing

```bash
pkill syncthing
```

### Start Syncthing

```bash
syncthing &
```

### View Syncthing Logs

```bash
syncthing
```

### Access Configuration File

```bash
cat $HOME/.local/state/syncthing/config.xml
```

## Troubleshooting

### Syncthing UI not loading

1. Ensure the dev container is running: Check the VS Code status bar
2. Verify port 8384 is forwarded: Check **Ports** tab in VS Code
3. Restart Syncthing:
   ```bash
   pkill syncthing
   syncthing &
   ```

### Configuration Issues

If you need to reset the configuration:

```bash
rm -rf $HOME/.local/state/syncthing
syncthing &
sleep 5
pkill syncthing
# Re-run the install script or reconfigure manually
```

## Development

To modify the Syncthing setup:

1. Edit `.devcontainer/install-syncthing.sh` for installation changes
2. Edit `.devcontainer/devcontainer.json` for container configuration
3. Rebuild the container: 
   - Command palette → **"Dev Containers: Rebuild Container"**

## References

- [Syncthing Documentation](https://docs.syncthing.net/)
- [VS Code Dev Containers](https://code.visualstudio.com/docs/remote/containers)
- [Syncthing Configuration](https://docs.syncthing.net/users/config.html)

## License

Please refer to the Syncthing project license for details on Syncthing itself.
