# Development Scripts

Windows batch files for Flask Python + React.js development workflow.

## Quick Start
```bash
quick.bat          # Setup everything and start both servers
status.bat         # Check development environment status
```

## Flask/Python
```bash
# Development
flask-dev.bat      # Start Flask dev server (debug mode)
flask-prod.bat     # Start Flask with Gunicorn

# Environment
pyinit.bat         # Create Python virtual environment
pip-install.bat    # Install all deps from requirements.txt
pip-install.bat flask-cors  # Install specific package + update requirements.txt
pip-freeze.bat     # Update requirements.txt

# Database
db-init.bat        # Create database tables
db-migrate.bat "add users"  # Create migration
db-migrate.bat     # Apply migrations
db-reset.bat       # Drop/recreate all tables (with confirmation)
db-seed.bat        # Run seed.py for sample data

# Testing & Quality
test-backend.bat   # Run all pytest tests
test-backend.bat tests/test_auth.py  # Run specific test
lint-backend.bat   # Check code with flake8/black/isort
format-backend.bat # Auto-format code
```

## React.js
```bash
# Development
react-dev.bat      # Start React dev server
react-build.bat    # Build for production

# Dependencies
npm-install.bat    # Install all package.json deps
npm-install.bat axios  # Install specific package
npm-update.bat     # Update all packages + audit fix

# Testing
test-frontend.bat  # Run tests with coverage
test-frontend.bat watch  # Run tests in watch mode
lint-frontend.bat  # Run ESLint
```

## Process Management
```bash
# Original scripts
fstart.bat / fkill.bat    # Frontend (port 3000)
bstart.bat / bkill.bat    # Backend (ports 5000, 6019, 6379)
astart.bat / akill.bat    # All services
ports.bat                 # Check ports 3000, 5000, 6019
port.bat 8080             # Check specific port

# Network & System
ip.bat             # Show IP address and system info
linux.bat          # Launch WSL Ubuntu
txt.bat "message"  # Send SMS via AWS SNS
```

## Deployment
```bash
deploy-prep.bat    # Run tests + linting + build
git-deploy.bat "v1.2.3"  # Prep + commit + push
docker-build.bat myapp    # Build Docker image
docker-run.bat myapp 8080 # Run container on port 8080
```

## Utilities
```bash
env-check.bat      # Verify Python/Node/project setup
clean.bat          # Remove cache/build files
debug.bat flask    # Start Flask with pdb debugger
debug.bat react    # Start React in debug mode
debug.bat full     # Debug both in separate windows
logs.bat flask     # View Flask logs
logs.bat error     # View error logs
backup.bat         # Create timestamped project backup
```

## Typical Workflow
1. **Setup:** `pyinit.bat` → `pip-install.bat` → `npm-install.bat`
2. **Develop:** `quick.bat` or separate `flask-dev.bat` + `react-dev.bat`
3. **Test:** `test-backend.bat` + `test-frontend.bat`
4. **Deploy:** `deploy-prep.bat` → `git-deploy.bat "message"`

## Port Assignments
- **3000:** React frontend
- **5000:** Flask backend
- **6019:** Additional backend service
- **6379:** Redis cache