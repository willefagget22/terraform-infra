# Part 2: Hands-On Tasks

Let's complete the Terraform code and deploy to Azure! Super simple - just 2 resources.

---

## TASK 1: Add Storage Account Name

**What to do:** Open `main.tf` and find `# TODO: TASK 1`

Replace `___FILL_IN_NAME___` with a storage account name.

**Rules for storage account names:**
- Must be **lowercase letters and numbers only**
- Must be **3-24 characters**
- Must be **globally unique**

**Example:** `stterraformlabna` (where "na" are your initials)

**Should look like:**
```hcl
resource "azurerm_storage_account" "main" {
  name                     = "stterraformlabna"
  ...
}
```

**Save the file!**

---

## TASK 2: Add Storage Tier

**What to do:** Find Task 2 in the same storage account resource

Replace `___FILL_IN___` with: `Standard`

**Should look like:**
```hcl
account_tier = "Standard"
```

**Save the file!**

---

## TASK 3: Deploy to Azure! 🚀

Now let's run Terraform commands to create your infrastructure.

### 3a: Initialize
```bash
terraform init
```
**What it does:** Downloads Azure provider  
**Expected:** "Terraform has been successfully initialized!"

---

### 3b: Validate
```bash
terraform validate
```
**What it does:** Checks if your code is correct  
**Expected:** "Success! The configuration is valid."

**If errors:** Check your storage account name (lowercase, no special characters)

---

### 3c: Plan
```bash
terraform plan
```
**What it does:** Shows what will be created  
**Expected:** "Plan: 2 to add, 0 to change, 0 to destroy"

You should see:
- ✅ Resource Group
- ✅ Storage Account

---

### 3d: Apply
```bash
terraform apply
```
**What it does:** Creates the resources in Azure

**Type:** `yes` when prompted

**Wait time:** 30-60 seconds (much faster than a VM!)

**Expected:** "Apply complete! Resources: 2 added"

🎉 **You deployed to Azure!**

---

## TASK 4: Verify in Azure Portal

**What to do:** Check your resources in Azure

1. Open: https://portal.azure.com
2. Click **"Resource groups"**
3. Find **"rg-terraform-lab"**
4. You should see:
   - ✅ Storage account (your name)

Click on the storage account to explore it!

---

## TASK 5: Explore Terraform State

### 5a: List Resources
```bash
terraform state list
```
**Shows:** Both resources Terraform is managing
```
azurerm_resource_group.main
azurerm_storage_account.main
```

---

### 5b: Show Storage Account Details
```bash
terraform state show azurerm_storage_account.main
```
**Shows:** All properties of your storage account (name, tier, replication, etc.)

---

### 5c: Show Everything
```bash
terraform show
```
**Shows:** Complete state of all resources

---

## TASK 6: Make a Change

### 6a: Add a Tag

Open `main.tf` and find the storage account tags:
```hcl
tags = {
  Environment = "Lab"
}
```

Add your name:
```hcl
tags = {
  Environment = "Lab"
  Owner       = "YourName"  # Add this!
}
```

**Save the file!**

---

### 6b: Plan the Change
```bash
terraform plan
```
**Shows:** "Plan: 0 to add, 1 to change, 0 to destroy"

---

### 6c: Apply the Change
```bash
terraform apply
```
**Type:** `yes`

**Expected:** "Apply complete! Resources: 0 added, 1 changed"

✅ **You updated live infrastructure!**

---

## TASK 7: Use Terraform Utilities

### 7a: Format Code
```bash
terraform fmt
```
**What it does:** Makes your code look nice

---

### 7b: Check Workspace
```bash
terraform workspace show
```
**Shows:** `default`

---

### 7c: Check Version
```bash
terraform version
```
**Shows:** Terraform and provider versions

---

## TASK 8: Clean Up

### 8a: Plan Destruction
```bash
terraform plan -destroy
```
**Shows:** What will be deleted

---

### 8b: Destroy
```bash
terraform destroy
```
**Type:** `yes`

**Wait:** 30-60 seconds

**Expected:** "Destroy complete! Resources: 2 destroyed"

---

### 8c: Verify
```bash
terraform state list
```
**Shows:** Nothing (empty!)

Check Azure Portal - resource group should be gone.

✅ **All cleaned up!**

---

## Summary

**Task 1-2:** Filled in values
- Storage account name (lowercase, unique)
- Storage tier: `Standard`

**Task 3:** Deployed to Azure
- `init`, `validate`, `plan`, `apply`
- Created 2 resources in ~30 seconds!

**Task 4:** Verified in Azure Portal

**Task 5:** Explored state
- `state list`, `state show`, `show`

**Task 6:** Updated infrastructure
- Added a tag
- Applied the change

**Task 7:** Used utilities
- `fmt`, `workspace show`, `version`

**Task 8:** Cleaned up
- `plan -destroy`, `destroy`

---

## Command Reference

```bash
# Setup
terraform init              # Initialize
terraform validate          # Check code
terraform fmt              # Format code

# Deploy
terraform plan             # Preview
terraform apply            # Deploy
terraform destroy          # Delete

# Inspect
terraform show             # Show state
terraform state list       # List resources
terraform state show <name>  # Show details

# Other
terraform version          # Version info
terraform workspace show   # Current workspace
terraform plan -destroy    # Preview deletion
```

---

## What You Learned

✅ Infrastructure as Code basics  
✅ Terraform workflow (init → plan → apply → destroy)  
✅ Created Azure resources with code  
✅ Explored Terraform state  
✅ Updated live infrastructure  
✅ Used Terraform commands  

**Much simpler - only 2 resources and 30 seconds to deploy!**

---

## Troubleshooting

**"Error: invalid storage account name"**
- Must be lowercase only
- No special characters
- 3-24 characters
- Must be globally unique (try adding your initials)

**"already exists"**
- Someone else used that name
- Try a different name (add numbers or initials)

**"Subscription not found"**
- Run `az login` again

---

**Great job!** 🎉 You now understand Infrastructure as Code!
