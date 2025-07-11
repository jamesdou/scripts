# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a collection of Windows batch utility scripts for development workflow automation. The scripts are primarily focused on process management, network monitoring, and development environment setup.

## Common Commands

### Development Server Management
- `fstart.bat` - Start frontend development server (runs `npm start`)
- `fkill.bat` - Kill processes on port 3000
- `fport.bat` - Check what's running on port 3000

### Backend/API Management  
- `bstart.bat` - Start backend services (runs `dc` command then `fstart`)
- `bkill.bat` - Kill processes on ports 5000, 6019, and 6379
- `bport.bat` - Check what's running on ports 5000 and 6019

### All Services Management
- `astart.bat` - Start all services (runs `dc` then `fstart`)
- `akill.bat` - Kill all development processes (runs both `bkill` and `fkill`)

### Network Utilities
- `port.bat [port]` - Check what's running on a specific port
- `ports.bat` - Check processes on ports 3000, 5000, and 6019
- `ip.bat` - Display system network information and IP addresses

### Environment Setup
- `pyinit.bat` - Initialize Python virtual environment
- `linux.bat` - Launch WSL Ubuntu environment
- `txt.bat` - Send SMS notifications via AWS SNS

## Architecture Notes

The scripts follow a modular pattern where:
- Individual service scripts (`fstart`, `bstart`) handle specific components
- Aggregate scripts (`astart`, `akill`) orchestrate multiple services
- Port management scripts provide monitoring and cleanup capabilities

The `dc` command referenced in several scripts appears to be a Docker Compose command for container management.

## Port Assignments
- Port 3000: Frontend development server
- Port 5000: Backend API server  
- Port 6019: Additional backend service
- Port 6379: Redis (likely for caching/sessions)

## Flask Python Commands

### Development Server
- `flask-dev.bat` - Start Flask in development mode with debug enabled
- `flask-prod.bat` - Start Flask with Gunicorn for production

### Python Environment
- `pyinit.bat` - Initialize Python virtual environment
- `pip-install.bat [package]` - Install packages and update requirements.txt
- `pip-freeze.bat` - Update requirements.txt with current packages

### Database Management
- `db-init.bat` - Initialize database tables
- `db-migrate.bat [message]` - Create or apply database migrations
- `db-reset.bat` - Drop and recreate all database tables (with confirmation)
- `db-seed.bat` - Seed database with sample data (requires seed.py)

### Testing & Code Quality
- `test-backend.bat [file]` - Run pytest tests
- `lint-backend.bat` - Run flake8, black, and isort checks
- `format-backend.bat` - Auto-format Python code with black and isort

## React.js Commands

### Development
- `react-dev.bat` - Start React development server
- `react-build.bat` - Build React for production
- `npm-install.bat [package]` - Install npm packages
- `npm-update.bat` - Update all npm packages and run audit fix

### Testing & Code Quality  
- `test-frontend.bat [watch]` - Run React tests (add 'watch' for watch mode)
- `lint-frontend.bat` - Run ESLint on frontend code

## Deployment & Build Commands

- `deploy-prep.bat` - Run all tests, linting, and build processes
- `docker-build.bat [image-name]` - Build Docker image
- `docker-run.bat [image-name] [port]` - Run Docker container
- `git-deploy.bat "message"` - Prepare, commit, and push deployment

## Utility Commands

- `quick.bat` - One-command setup: check env, install deps, start servers
- `status.bat` - Show development environment status dashboard
- `env-check.bat` - Verify development environment setup
- `clean.bat` - Remove cache files, build artifacts, and logs
- `debug.bat [flask|react|full]` - Start debugging sessions
- `logs.bat [flask|error|access]` - View application logs
- `backup.bat` - Create timestamped backup of project files

## Development Workflow

### Quick Start
1. `quick.bat` - Sets up everything and starts both servers
2. Visit http://localhost:3000 (React) and http://localhost:5000 (Flask)

### Typical Development
1. `env-check.bat` - Verify environment
2. `flask-dev.bat` and `react-dev.bat` in separate terminals
3. `status.bat` - Check service status anytime
4. `akill.bat` - Stop all services when done

### Before Deployment
1. `test-backend.bat` and `test-frontend.bat` - Run all tests
2. `lint-backend.bat` and `lint-frontend.bat` - Check code quality
3. `deploy-prep.bat` - Complete pre-deployment checks
4. `git-deploy.bat "Deploy message"` - Deploy to repository

For targeted development:
- Frontend only: `fstart.bat` / `fkill.bat`
- Backend only: `bstart.bat` / `bkill.bat`