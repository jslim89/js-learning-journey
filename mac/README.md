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

## Delete provisioning profile on XCode 5
Open up terminal
```sh
$ cd ~/Library/MobileDevice/Provisioning\ Profiles
$ ls -la
total 120K
-rw-r--r-- 1 user group  13K Oct 22 13:37 13C42BED-0555-4684-A905-5547B2293D46.mobileprovision
-rw-r--r-- 1 user group 7.7K Oct 19 12:53 3CA5CC4A-E995-41D6-BA54-66A3AFB4061F.mobileprovision
-rw-r--r-- 1 user group 7.4K Sep 11 10:57 F4BCC928-32B7-42F8-85EB-EA47ADE86C14.mobileprovision
```

See which one you want to delete (when you added the profile)
```sh
$ rm 13C42BED-0555-4684-A905-5547B2293D46.mobileprovision
```

Reference: [Delete provisioning profile from Xcode 5](http://stackoverflow.com/questions/18923095/delete-provisioning-profile-from-xcode-5/18923552#18923552)
