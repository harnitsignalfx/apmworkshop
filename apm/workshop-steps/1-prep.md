## APM Preparation

---

### Prep Step 1: Log in to your Splunk Observability account to identify token/realm  

Check your [Splunk Observability Account](https://app.us1.signalfx.com/o11y/#/home) (your welcome email has this link) and identify your TOKEN and REALM- these are available in the profile menu in your Splunk Observability account. Note that the realm component i.e. `us1` may be different for your account based on how you signed up.

How to find realm:

`Splunk Observability Menu -> Your Name -> Account Settings`    

<img src="../assets/01-realm.png" width="360" />  

How to find token:  
<img src="../assets/02-token.png" width="360" />  

---

### Prep Step 2: Choose/ Create Lab Environment  

Splunk Observability is for **server environments**.    

This workshop uses **Ubuntu Linux** as the server environment.    
You can use any Ubuntu platform- bare metal, VM, or cloud VM.

You can choose an existing Ubuntu machine that you have or create or you can follow our guide below to make an Ubuntu VM on your Mac / Windows PC.  
If you chose your own Ubuntu machine, you can set it up with the Workshop software with this command: 

`bash <(curl -s https://raw.githubusercontent.com/harnitsignalfx/apmworkshop/master/setup-tools/ubuntu.sh)`

#### Guide: Create an Ubuntu Linux environment on a Mac or PC and install the necessary software components:

#### <ins>Mac</ins>

**#1 Install Brew**  

Install [brew package manager](https://brew.sh):  
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` 

Make sure `brew` is fully upgraded: `brew upgrade`

Results should be at least 1.5:
```
$ brew --version
Homebrew 2.6.0
```

**#2 Install Multipass**

We will use [Multipass](https://multipass.run) as a hypervisor for Mac: 

Install Multipass: `brew cask install multipass`

If needed, further instructions are here: https://multipass.run/docs/installing-on-macos

Do one final brew upgrade before spinning up VM: `brew upgrade`

#### <ins>Windows</ins>  

Follow Multipass Windows installation instructions: https://multipass.run/docs/installing-on-windows

**#3 Launch Multipass Ubuntu VM**

Create your VM called "primary":  
`multipass launch -n primary`

This will download Ubuntu and may take a few minutes the first time.

Basic multipass commands:  
Shell into VM: `multipass shell primary`  
Exit VM: `exit`

To manage multipass VM:  
`multipass stop primary` stops the VM  
`multipass delete primary` deletes the VM from the hypervisor  
`multipass purge` purges created images but leaves the ubuntu template intace  

**#4 Install Lab Software On Ubuntu VM**

A bootstrap script will install everything needed and clone this repo.  
This will take up to 10 minutes to execute- leave it running until complete.  

`multipass shell primary`  

Once in your Multipass Ubuntu VM:

`bash <(curl -s https://raw.githubusercontent.com/signalfx/apmworkshop/master/setup-tools/ubuntu.sh)`

---

[Return to workshop for next step](../README.md)
