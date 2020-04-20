# LineageOS device tree for the Samsung Galaxy S10+

Description
-----------

This repository is to build LineageOS for the S10+ (SM-G975F)


Device Specs
-----------
 
 Basic   | Spec Sheet
 -------:|:-------------------------
 SoC     | Exynos 9820
 CPU     | Dual-core (Custom CPU), Dual-core (Cortex®-A75), Quad-core (Cortex®-A55)
 GPU     | ARM Mali™-G76 MP12
 Storage and Memory  | 8GB RAM with 128GB internal storage, 8GB RAM with 512GB internal storage (Only ceramic models), 12GB RAM with 1TB internal storage (Only Performance Edition ceramic models)
 Shipped Android Version | Android 9.0 (Pie); OneUI 1.1
 Battery | Non-removable 4100mAh mAh battery
 Dimensions | 157.6 x 74.1 x 7.8 mm
 Display | 6.4" Quad HD+ Dynamic AMOLED, Infinity-O Display (3040x1440), 522 ppi, HDR10+ certified
 Rear camera  | 12MP Telephoto Camera, 12MP Wide-angle Camera, 16MP Ultra Wide Camera
 Front camera  | 10MP Selfie Camera, 8MP RGB Depth Camera


How to build LineageOS
----------------------

* Make a workspace:

        mkdir -p ~/lineageos/repo
        cd ~/lineageos/repo

* Initialize the repo:

        repo init -u git://github.com/LineageOS/android.git -b lineage-17.1

* Create a local manifest:

        vim .repo/local_manifests/roomservice.xml

        <?xml version="1.0" encoding="UTF-8"?>
        <manifest>
            <project name="whatawurst/android_device_samsung_beyond2lte" path="device/samsung/beyond2lte" />
            <project name="whatawurst/android_device_samsung_exynos9820-common" path="device/samsung/exynos9820-common" remote="github" />
            <project name="whatawurst/android_kernel_samsung_exynos9820" path="kernel/samsung/exynos9820" remote="github" />
            <project name="whatawurst/android_vendor_samsung_beyond2lte" path="vendor/samsung/beyond2lte" remote="github" />
            <project name="LineageOS/android_device_samsung_slsi_sepolicy" path="device/samsung_slsi/sepolicy" remote="github" />
            <project name="LineageOS/android_hardware_samsung" path="hardware/samsung" remote="github" />
        </manifest>

* Sync the repo:

        repo sync

* Extract vendor blobs

        cd device/samsung/beyond2lte
        ./extract-files.sh

* Setup the environment

        source build/envsetup.sh
        lunch lineage_beyond2lte-userdebug

* Build LineageOS

        m -j20 bacon
