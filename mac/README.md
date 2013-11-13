# Lessons

## Enable write support for NTFS on OS X Mavericks

Retrieve the UUID of the drive you want to write on
```sh
$ diskutil info /Volumes/YourDriveName | grep UUID
   Volume UUID:              22F1DF1C-AFDE-B507-A15B-FC9296BB2E2B
```

Edit the file **/etc/fstab**
```sh
$ sudo vi /etc/fstab
```

Add the following content
```
UUID=22F1DF1C-AFDE-B507-A15B-FC9296BB2E2B none ntfs rw,auto,nobrowse
```

Unmount the drive, and then remount. It should now writable.

## Missing Air Drop in Mountain Lion
Open up terminal
```sh
$ defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
# restart finder
$ killall Finder
```

Reference: [Air Drop missing](https://discussions.apple.com/thread/4300050#19735820)
