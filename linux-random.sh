#!/bin/bash

######################################################################################################################################

## Add your questions below. Each question should begin with "# QQ #".
## Questions can be deactivated and removed from the random picking by changing the `# QQ #` string into anything else, for example `# DD #`

######################################################################################################################################

# QQ #	Create two rootless podman containers, mysql and a httpd. Make sure they start before users log in, can resolve each other by hostname and have persistent storage. Use network 10.10.1.0 with subnet mask 255.255.255.128 After a reboot, without logging into the user, check if container is running. Run an arbitrary command on the containers while they are up. If all is ok, show the logs and top of the container, then stop it and return to a clean state
# QQ #	Run a find command and redirect stdout and stderr to separate files 
# QQ #	Register and attach a subscription
# QQ #	Reset the root password using at least 3 methods
# QQ #	Create a small script that echoes the word "TEST" for n times, where n is the first parameter passed to the script. If the script is run without parameters, ask for n in stdin. If the user inputs an invalid n, exit with exit code 4
# QQ #	Create a partition that fills the entire disk, format it, then resize it to make room for another partition without breaking the previous fs
# QQ #	Set up a new disk with MBR partitioning scheme. Create a volume in /storage using LVM, using 16MiB extents and with size 200 extents, verify both parameters are correctly set. Make an ext4 filesystem on it with 0% reserved blocks. Add one disk and span that filesystem across two physical disks. Remove everything and clean the fs and lvm headers
# QQ #	Create a Stratis pool named 'data' that spans two disks with two filesystems named 'external' and 'internal'. Make sure it lists two devices and two filesystems. snapshot external, remove a file from 'external' fs. Access the removed file from the snapshot. Remove everything and return to a clean volume
# QQ #	Boot into emergency and rescue modes, list the differences between the two
# QQ #	Use systemctl to choose whether to boot to GUI or to TEXT mode
# QQ #	Set up a local repository from a RHEL iso file
# QQ #	In your hypervisor, create a virtual network that has no DHCP and is ipv6 enabled. Install a new RHEL instance on a fresh virtual machine on that same network in unattended mode, using an answer file that is served by a NFS share by server 1, using ipv6
# QQ #	Create two volumes, ext4 and xfs. Perform filesystem checks on both. Dump the content of a broken xfs partition into another
# QQ #	Make journalctl logs persistent
# QQ #	Simulate a log rotation with a certain configuration, showing what would happen
# QQ #	Mention the difference between using '' and "" in bash
# QQ #	Create a cronjob that only runs from Mon to Fri between 11 pm and 7 am every 20 minutes and outputs "MAINTENANCE WINDOW" to the journalctl and to all active shells
# QQ #	Using grep, show all the lines of /etc/shadow that do not begin with 'pippo', do not end with 'bob', contain '!' but also have to contain ':' OR '$', then also show the previous and next 3 lines
# QQ #	Create a tar archive named 'test' from folder /etc with and without gzip compression, then extract it. Try again with xz compression
# QQ #	Using sed, replace all occurrences of the word 'alice' with 'bob' in a random file
# QQ #	Using awk, show only the column 3 of /etc/shadow assuming separator ':'
# QQ #	Set the default umask of a certain user so that every file and folder he creates is 700 by default
# QQ #	Create a custom tuned profile with associated comment that sets swappiness to 42 and persists between boots. Show which profile is currently on before setting the new one
# QQ #	Check current timezone, set a new one and then go back to the correct one. Set a random, wrong time of the day. Set up the host to sync with ntp.pool.org, verify that sources are set and force a sync immediately
# QQ #	Create a thin provisioned LVM volume that offers data deduplication, with size 10G that exposes a size of 100G
# QQ #	Set up a NFS server on server 1 and expose /nfsdata/internal and /homes with 3 user folders in it, then on server 2 set up a solution that mounts the user folders on demand. Also set up a persistent mount of /nfsdata/internal
# QQ #	Set up Apache in a nondefault documentroot /web with nondefault port 89 and ensure SELinux is configured properly to accommodate these choices
# QQ #	Create and terminate a zombie process
# QQ #	Using kernel parameters, put all CPU cores offline except one, then launch 'sleep 3000' and 'sleep 6000' processes. Send them in background, then experiment with their scheduling and nice value so that either 3000 or 6000 gets the most CPU. At the end, reenable all the CPU cores
# QQ #	Visit the Network Manager interface configuration path
# QQ #	Regenerate grub assuming both BIOS and EFI boot. Remove all the initramfs files in /boot and try to boot. Solve the situation and get a bootable system again
# QQ #	Make room on an existing disk for a new swap partition and use it persistently. Increase swap further creating a new persistent swap volume but, for this second swap space, don't use a partition
# QQ #	Make sure that user bob cannot create cronjobs
# QQ #	Configure /run/test directory to hold temporary files. If the files aren't being read for more than 2 minutes, files are removed automatically. Directory permissions should be 0770
# QQ #	Start a sleep 3000 process with the lowest possible priority, then set it to run in realtime
# QQ #	Create a folder /special and set permissions so that 'alice' and 'bob', belonging to two different groups, can both read and write to the folder, but not anyone else 
# QQ #	Create a folder /external and set permissions so that 1) it belongs to group 'external' 2) every new file belongs to 'external' 3) users can only remove the files they create 4) a script with content `sleep infinity` in the folder always runs as owner user regardless of who launches it
# QQ #	Without using sleep or cronjobs, plan a command to be executed in 2 minutes and another at 2 hours. Confirm both are queued
# QQ #	Set a cronjob for user 'alice' so that at 6.45 am, 7.45 am and 8.45 am every day, a script is run. The script sends a mail with subject "Subject" and body "Body" to root@localhost. Variabilize the script so that Subject and Body are passed from the cronjob
# QQ #	Read all sysctl variables. Persistently set vm swappiness to 6 without using any tuned profile. If a tuned profile is also set, make sure it doesn't override your new vm swappiness
# QQ #	Update grub so that SELinux is disabled on next boot for all kernels. Also make sure that the initial grub timeout is set to 1 second
# QQ #	Use a single command to persistently enable firewall services: rpc-bind mountd nfs
# QQ #	Using firewalld, for the internal zone only, non-persistently allow all traffic from source 10.0.0.10/24. Using the same command, verify that the setting applied
# QQ #	Copy /etc/shadow to /tmp/test in a such way that the same SELinux attributes are kept. Do it again without preserving the attributes but fix them manually and persistently
# QQ #	Create a config file to do an unattended install of RHEL. Make it so that it asks for root password on each install but establish at least a specific timezone and keyboard layout. Verify the syntax is correct
# QQ #	Use systemd-tmpfiles to clean /tmp every 3 days, by using /etc/tmpfiles.d/tmp.conf
# QQ #	Show the current gateway of the default podman network
# QQ #	Create a script that outputs the sum of the numbers contained in two environment variables and read those variables from another file. Send that output to stderr
# QQ #	Set up ssh on a nonstandard port. Perform a dry run of a destructive rsync between /etc of server1 and /etc of server2 using ssh on that port. Verify that the sync only shows files that are different and not the entire /etc
# QQ #	Get a successful run of sealert command
# QQ #	Create users 'beta', 'gamma' and 'delta'. User 'gamma' needs to set his password on the first login, 'beta' doesn't allow interactive shell login at all. User 'delta' password must be changed every 90 days at most but not sooner than 7 days
# QQ #	Using firewalld, block all the communications from a specific ip
# QQ #	Add user 'alice' to sudoers and ensure it can run a 'dnf update' without password
# QQ #	Demonstrate and describe usage of skopeo and buildah
# QQ #	Create a cronjob that executes daily at 5 am and which runs a script called 'latest.sh'. The script generates a list of all the files that have been created in the past 24 hours and writes it to /newfiles.txt
# QQ #	Create a job that runs a dnf update daily at 9 am. If the host is down at 9am, make sure it still runs the task as soon as host is turned on
# QQ #	Write a script that checks for the existence of folder /myfolder and exits with code 3 if it doesn't exist. If the folder exists, create 400 numbered folders in it, each one containing the subfolders "in" and "out", without using cycles. Simulate the script and verify it runs after creating the folder. Repeat the task using a for and while cycle
# QQ #	Set up a VM to get a ipv6 address and connect to it succesfully through SSH. List several ways or configuration modifications that would break networking
# QQ #	Set up two hosts and manually configure ipv4 and ipv6 networking without using a DHCP. Make sure you can connect to both hosts and that they ping each other. Connect with SSH that is listening on a nonstandard port and install keys using ipv6 protocol


######################################################################################################################################

clear

which shuf 2>/dev/null 1>/dev/null

if [[ $? -ne 0 ]] ; then
	echo "No shuf command found. It's usually part of coreutils package. If in doubt, run a 'dnf whatprovides shuf' to know which package installs it."
	exit 1
fi


if [[ -z "$1" ]] ; then	
	while true ; do
		grep -e '^# QQ' $0 | awk -F 'QQ' '{ print $2 }' | shuf -n 1
		read continue
		clear
	done 
else
		echo "QUESTION SET:"
		echo "============================================================"
		echo ""
		grep -e '^# QQ' $0 | awk -F 'QQ' '{ print $2 }' | shuf -n $1
		echo ""
		echo "============================================================"
		echo ""
		echo ""
		exit 0
fi
