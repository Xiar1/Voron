# Welcome to the all in one guide for setting a M5P from BTT up with a CB1 in CAN bridge mode!
In this short guide I will guide you throught the steps to get your CB1 online and the M5P flashed in CAN bridge mode. We will be using the MINIMAL image for the CB1 as well as KIAUH to help us with this task.

## Let's begin with getting the CB1 OS image flashed and wifi setup

To start head here: https://github.com/bigtreetech/CB1/releases and grab the latest MINIMAL image for the CB1. We are going to use the MINIMAL (Last time that's in all caps :) ) image for the CB1 to help reduce any extras that could potentially cause issues later down the road for you. 

To flash the CB1 with the minimal image we are going to use the [Raspberry PI Imager](https://www.raspberrypi.com/software/). There's not really a specific reason for this other than that I like it.

In the RPI Imager you will select the newely downloaded minimal image by clicking on the **CHOOSE OS** button and then scrolling to the bottom to select the custom image button.

![image](https://github.com/user-attachments/assets/283dcc02-1649-4f9f-ba25-01b105e8b8a6)
![image](https://github.com/user-attachments/assets/dc4d4f9b-240e-45a5-805a-d5e2f225b5ed)
![image](https://github.com/user-attachments/assets/a23ac6a2-5ae8-43f3-a1e4-0d9d3d9e4892)

After selecting the minimal image you will now select the micro sd card you wish to use. I recommend only having 1 USB storage drive plugged in during this time to prevent overwriting the incorrect drive. Press the **CHOOSE STORAGE** button to choose the correct storage drive.

![image](https://github.com/user-attachments/assets/23401d40-f57a-4b80-a5de-b4f3e270ea48)
![image](https://github.com/user-attachments/assets/a3d9c2b3-50b1-4a5c-a282-6ac907b1612b)

Now that we have that ready. We are going to press the **NEXT** button and select **NO** when prompted about customisation options. These customisation options do not work with the CB1

![image](https://github.com/user-attachments/assets/2678863a-8883-4f8f-b772-78aac7d0eb5b)
![image](https://github.com/user-attachments/assets/519a25cd-67ea-405a-9308-b5100cf90f8c)

Now just wait for the imager to finish flashing and verifying the image on the SD card.

Did you wait for it to finish? No? Please wait some more. Yes? Let's continue!

Now that its done flashing it should have ejected the sd card automatically. Please unplug the sd card and replug it in. 

Inside the boot section of the drive that you now have access to there is a system.cfg file. We are going to open this file in order to enable wifi and give it our wifi information.

![image](https://github.com/user-attachments/assets/02864fd1-710c-46b7-a5fa-a3c76ba0d42a)

Inside this file on lines 26 and 28 you'll find the WIFI settings. In front of these lines is `#` that is commenting out the line. Please remove that, then change the `ZYIPTEST` SSID to your wifi SSID and the `12345678` to your wifi password. These are case sensitive so be sure its typed in correctly.

![image](https://github.com/user-attachments/assets/0b6adec5-3341-4581-819b-dea2d6d09906)
![image](https://github.com/user-attachments/assets/a863d272-3b89-4b88-b901-2a051daeaa82)

Now save the file (CTRL+S in most editors) and eject the SD card. You can now take the sd card from your computer and put it in the SBC slot next to the USB ports on the M5P. 
There are 2 ways forward now. If the M5P is already in your printer. I recommend having the 24v psu connected, disconnecting everything else, and turning on power to the printer. If it is not then you can add the 5v USB jumper instead and connect a USB-C cable to power on the CB1.

## CB1 KIAUH and Updating time!

It will take a few minutes for the CB1 to become available to see on your network. I recommend using a net scanning tool to find it. The only one I use is on my phone and is called "Net analyzer". It will show up with the name `bigtreetech-cb1`.

Here's where one thing will be differnt over some setups. I prefer to use [WINSCP](https://winscp.net/eng/index.php) for connecting to my boards even for the [PUTTY](https://www.putty.org/) side of things. If you decide to use it too. You'll need to install both. Otherwise. Putty is pretty straightforward for connecting to a board.

### Here we go!

When you first open WINSCP you'll be prompted to connect. 

![image](https://github.com/user-attachments/assets/b9ce9d7d-5879-43a8-8183-c79738aa0282)

You'll want to type in the IP address for your CB1 in the host name field. And the type in `root` for the username and `root` for the password.

![image](https://github.com/user-attachments/assets/c672b068-509c-4b22-a0c4-370830932a5c)

Now click **LOGIN** and when prompted about the certificate warning click accept.

![image](https://github.com/user-attachments/assets/8f504110-1167-4a78-b474-59a92e07cc85)
![image](https://github.com/user-attachments/assets/f5b71df0-c53d-4518-8b34-dd09a934cc92)

Now you will want to press `CTRL+P` to bring up putty. Putty will prompt you to type in a password again. Type in `root` again. From here the terminal will prompt you to setup a new root password (for this guide I will be using `biqu` for the password and username going forward) and then you will select `1` and press enter for the default system command shell to be set to bash. Now you will be prompted to provide a username and password for a user account. (Again. I will be using `biqu` for both. You will also be prompted for your real name. I have no idea why this is yet. I will be setting it to `biqu` as thats my username to login with.

![image](https://github.com/user-attachments/assets/e3d884d3-cef3-4a47-b0c5-8d6ad837d6a9)
![image](https://github.com/user-attachments/assets/b0ef1b99-6be2-4502-9069-10130e2b55e7)
![image](https://github.com/user-attachments/assets/46195807-a4d3-4db5-b8b4-e4f51c0c5803)
![image](https://github.com/user-attachments/assets/4786fe55-e1d2-4f34-9cb7-f46341dbd4f5)

You will be asked a few questions now for setup. Answer these questions as you wish.

![image](https://github.com/user-attachments/assets/19e5bb61-a048-481c-ae1b-2e50634cd71f)
![image](https://github.com/user-attachments/assets/6ab65649-e8e2-4b82-be5c-2e310cc5cc98)

You will now be prompted with this screen. It's time to close this session as we don't want to be in root anymore.

![image](https://github.com/user-attachments/assets/0c21ae6b-d70a-46db-ab01-24fa6cb62dcf)
![image](https://github.com/user-attachments/assets/287dee1e-aa6f-4dff-b713-4c57e3dd9ed0)
![image](https://github.com/user-attachments/assets/11294799-bc55-4630-9d90-252b6a31330e)
![image](https://github.com/user-attachments/assets/2a35f9bb-2b32-4c16-8c60-88f74f390536)

You will now be prompted to login in again. Use the same IP as before but this time use that new username and password we set previously. I also recommend saving these settings to make logging in faster later on. You can also name the site to keep track of what is what more easily.

![image](https://github.com/user-attachments/assets/dc25b0fc-86c8-4ff0-b01d-12bccc5a52b0)
![image](https://github.com/user-attachments/assets/23cde340-4e67-4ef2-af5b-827a9c15e534)

Now press `CTRL+P` to bring up Putty again. Type in that password. And we are ready for the next part of installing KIAUH, Klipper, Moonraker, and Mainsail! (You can choose to use Fluidd instead if you'd like. It will make no differnce to this guide.)

## Time to install KIAUH!

Going forward all commands will have been copied from [KIAUH](https://github.com/dw-0/kiauh). This is just to make things easy for me. To paste a command in Putty use the right click button on your mouse instead of `CRTL-V`.
Now. In Putty run the command `sudo apt-get update && sudo apt-get install git -y` and then `cd ~ && git clone https://github.com/dw-0/kiauh.git` and lastly `./kiauh/kiauh.sh` to open KIAUH. You may be prompted to try KIAUH v6. If so. I recommend selecting `1` as I will be using v6 for this guide.

![image](https://github.com/user-attachments/assets/16156b93-a93b-4f8d-becc-c3951a9b9afa)

You will now be prompted with the main menu. Here we will be installing klipper, moonraker, and finally mainsail. 

![image](https://github.com/user-attachments/assets/293c856f-7b8a-4614-ab0b-b5587f471a46)

I'm going to go a little fast in these next steps just to reduce the length of this a smidge. 

### First Klipper
Select `1` for `Install`, `1` again this time for `klipper`, Use the defualt number of instances (1) by simply pressing [enter], you don't need an example config but if you'd like it press `y`, if not press `n`. This will take a bit to install and it will prompt you at least once for your password.

![image](https://github.com/user-attachments/assets/f2a24842-5fd4-4dcc-a0b1-fd6430397762)
![image](https://github.com/user-attachments/assets/e2072f11-3a29-459c-b56f-21429a4f97ef)

If you recieve any errors during install of klipper usually just retrying the install fixes the issue. It will ask you if you want to overwrite and to recreate the virtualenv. Say yes.

### Now moonraker

You should still be on the install screen in KIAUH. Select `2` for `moonraker`, `y` to create the example config (you'll need this in the end anyways), will take a bit to install.

If you recieve any errors during install of moonraker usually just retrying the install fixes the issue. It will ask you if you want to overwrite and to recreate the virtualenv. Say yes.

### And lastly Mainsail!

You should still be on the install screen in KIAUH. Select `3` for `mainsail`, `y` for the recommeneded config, [enter] to use the default port, will take a bit to install.

If all has gone well so far. You should now be able to type in the IP address to your CB1 in your browser and view mainsail.

![image](https://github.com/user-attachments/assets/7eeca2ea-2526-47bd-8a65-904820b086c3)

And in Putty you should be able to press `b` to go back to the main menu and see these installed:

![image](https://github.com/user-attachments/assets/b3bf0b38-6ada-487b-91cb-c0996d4aa549)

You can now press `q` to quit out of KIAUH

Hooray! We are now ready for CAN bus things!

## Time for CAN bus!

These next steps will all be copied from [Esoterical's CAN bus bible](https://canbus.esoterical.online/)

First. PI related CAN bus things. 

Run these commands in order, DO NOT SKIP EVEN ONE!

```
sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd
systemctl | grep systemd-networkd
sudo systemctl disable systemd-networkd-wait-online.service
```

You should have an output like this after the third command:

![image](https://github.com/user-attachments/assets/249a7c45-5d1c-49ac-bd64-bcbdfa2752d9)

```
echo -e 'SUBSYSTEM=="net", ACTION=="change|add", KERNEL=="can*"  ATTR{tx_queue_len}="128"' | sudo tee /etc/udev/rules.d/10-can.rules > /dev/null
cat /etc/udev/rules.d/10-can.rules
```

Output should be:

![image](https://github.com/user-attachments/assets/c696e6f6-358e-4a06-a0e1-3ba1eaabe4dc)

```
echo -e "[Match]\nName=can*\n\n[CAN]\nBitRate=1M\n\n[Link]\nRequiredForOnline=no" | sudo tee /etc/systemd/network/25-can.network > /dev/null
cat /etc/systemd/network/25-can.network
```

Output should be: (Ignore the `RestartSec=0.1` like in the screenshot. That has been removed)

![image](https://github.com/user-attachments/assets/73af34cb-1dbe-4ec9-93b8-6ac046f445af)

Now reboot with `sudo reboot now`
To easily reconnect via Putty right click the top bar and select `Restart Session`. Login with your password.

CAN is now setup on the CB1.

## Now for katapult and klipper can bridge mode.

Put the M5P into DFU mode by holding the `boot0` button and pressing the `reset` button. Run `lsusb` and your output should look like this:

![image](https://github.com/user-attachments/assets/82c3dd65-0b67-440c-9e70-2a91b77b80ae)

Run these commands in order without skipping any. They will ask you if you want to continue for bigger files. Select `y`:
```
sudo apt update
sudo apt upgrade
sudo apt install python3 python3-serial
test -e ~/katapult && (cd ~/katapult && git pull) || (cd ~ && git clone https://github.com/Arksine/katapult) ; cd ~
cd ~/katapult
make menuconfig
```

You should now be in the katapult config menu. Set the options as so:

M5P :

PLACE IMAGE HERE

Press `q` to quit and then `y` to save

Run:
```
make clean
make
sudo dfu-util -R -a 0 -s 0x08000000:leave -D ~/katapult/out/katapult.bin -d 0483:df11
```

You will be looking for a line saying `file downloaded successfully`:

![image](https://github.com/user-attachments/assets/98e37324-c2b7-4ab6-8184-40bc2380af77)

Now to check that the board successfully has katapult installed run `ls /dev/serial/by-id` and the output should be similar to this:

PLACE IMAGE HERE

If you do not get this press the `reset` button on the board twice and try again.

Next run:
```
cd ~/klipper
make menuconfig
```

You should now be in the klipper config menu. Set the options as so:

M5P:

PLACE IMAGE HERE

Press `q` to quit and then `y` to save

Run:
```
make clean
make
sudo service klipper stop
ls /dev/serial/by-id/
```

You should have an ouput like this:

PLACE IMAGE HERE

You will now run this command `python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-katapult_your_board_id` but change the end to be your boards serial. To copy from Putty simply highlight the text. In my example here the new command with the changed serial will be `python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/`

Output should show something like this:

![image](https://github.com/user-attachments/assets/fcc69972-b67f-4edc-8447-ae8b404b4371)

Running `lsusb` should show a can adapter now:

![image](https://github.com/user-attachments/assets/44116499-6dd7-469a-b0b8-4e9651386c49)

And `ip -s -d link show can0` should now show a can network:

![image](https://github.com/user-attachments/assets/9bf0029e-732a-4607-8561-26f38e931857)

Now you can run `~/klippy-env/bin/python ~/klipper/scripts/canbus_query.py can0` to get the UUID for your board and update your printer.cfg via mainsail to use that UUID:

![image](https://github.com/user-attachments/assets/2c2ed66b-4e9e-4638-ae21-1f6fa6e7564c)
![image](https://github.com/user-attachments/assets/d44ec4ff-f966-4404-8216-7d09d04884d8)

Run `sudo service klipper start` to start klipper and:
Congratulations! You are now ready to go back to whatever guide you were following before and continue with getting your printer working with a functional CAN bus!




