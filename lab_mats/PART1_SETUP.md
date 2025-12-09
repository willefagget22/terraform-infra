# Part 1: Setup & Installation

Quick guide to install everything you need for this Terraform lab.

## What You'll Do

- Install tools (Homebrew, Azure CLI, Terraform)
- Log in to Azure
- Fill in 2 simple values in code
- Run Terraform commands to deploy
- Create a Storage Account in Azure (~30 seconds!)

---

## Installation Steps (10-15 minutes)

### Step 1: Install Homebrew

Open **Terminal** and run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Verify it works:
```bash
brew --version
```

---

### Step 2: Install Azure CLI

```bash
brew update && brew install azure-cli
```

*This may take 2-3 minutes.*

Verify:
```bash
az --version
```

---

### Step 3: Install Terraform

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

Verify:
```bash
terraform --version
```

---

### Step 4: Get an Azure Subscription

You need an Azure subscription.

**Have one?** Great, you're ready!

**Need one?** Sign up for free: https://azure.microsoft.com/free/
- $200 free credits
- Credit card needed for verification (no charges)

---

## Azure Login & Setup

### Step 1: Log in to Azure

```bash
az login
```

A browser will open. Sign in with your Microsoft account.

Verify:
```bash
az account show
```

---

### Step 2: Open Lab Directory

```bash
cd "/Users/nikko/Documents/AW hackathon"
```

Verify:
```bash
ls
```

You should see: `main.tf`, `PART1_SETUP.md`, `PART2_TASKS.md`, etc.

---

## Ready!

🎉 **All set!** 

👉 **Next:** Open `PART2_TASKS.md` and start the tasks!

---

## Troubleshooting

**"command not found: brew"** → Close/reopen Terminal  
**"command not found: terraform"** → Close/reopen Terminal or reinstall  
**Azure login fails** → Check internet, try https://portal.azure.com first  
**No subscription** → Sign up at https://azure.microsoft.com/free/
ƒ