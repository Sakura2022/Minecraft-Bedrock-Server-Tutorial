# Minecraft Bedrock Server Tutorial
Minecraft Bedrock Edition server setup (Ubuntu Server)

My orignal article was published on BiliBili. Link: https://www.bilibili.com/read/cv25659542

This article will start from scratch to explain the process and all the details of setting up a "Minecraft Bedrock Edition" server. I have always believed that only a server you own is a reliable server. So, I spent a few days tinkering with this, and the main purpose of writing this article is also a memo to prevent myself from forgetting. Before I begin, I need to emphasize that this Bedrock Edition server only supports X86/X64 architecture CPUs and does **not support ARM architecture**. In other words, this server cannot be hosted on a Raspberry Pi. Below is the table of contents for this article.

*Select a Server

*Installing the Bedrock Edition Server

*Bedrock Edition Server Configuration

*Setting up Scheduled Backups

*Setting up Scheduled Shutdowns and Backups

*Commands and Usage

## Select a Server

There are a lot of available options on selecting a server, and here are some suggestions. Firstly, the server's hardware configuration determines both the number of simultaneous online players and the loading speed of maps. When I talk about hardware configuration, I am referring to the number of CPU cores, the amount of memory, and the server's bandwidth. Of course, the higher the configuration, the better it would be (haha, if you have the budget ^_^). However, through testing, it has been found that 1 core with 1GB of memory (1 core 1GB) can also provide a smooth gaming experience, although there is a chance of running out of memory. In cases with limited memory, it is strongly recommended to schedule regular server restarts, as this effectively clears the memory.

Another point to note is that if you are renting a server, it's essential to choose one that is geographically close to your physical location. This helps reduce in-game latency, particularly noticeable in the speed of terrain generation after teleportation within the game.

For home computers, you can install various types of operating systems, such as Windows, Windows Server, Linux distributions like Ubuntu, or Ubuntu Server. If you are using the Windows system, it's quite simple. You can download the files from the official website and click to run. I recommend using Windows 10 Professional. The reason for choosing Windows 10 is that it is more stable compared to Windows 11. Selecting the Professional edition is because it comes with a very useful feature, which is "Remote Desktop Connection." In a local area network environment, the latency is incredibly low. Only computers with the Professional edition can be controlled. You can use a Home edition system to remotely control a server with the Professional edition installed using this software.

Now, let's talk about network issues. Home networks are usually part of a local area network and generally cannot be accessed from the public internet. In this case, you need to use port forwarding to allow players on the public internet to access the server. Some people say that home networks use dynamic IP addresses (DHCP) and require various software solutions or obtaining a public IP address. Indeed, this makes sense, but I haven't researched it. In general, running a server on a home computer is usually done for experimentation and casual gaming. If you intend to run a server for an extended period, it's better to rent a dedicated server. Therefore, for this type of home server, being accessible on the public internet for a short period is sufficient. This is quite straightforward, using the port forwarding feature on your router. For example, Xiaomi routers have port forwarding capabilities.

![Image text](https://i0.hdslb.com/bfs/article/5c21da8ec79cace90b66d3749acc6cbef06f3594.png@1256w_892h_!web-article-pic.webp)

Here are several options to choose from. If only a few ports need to be forwarded, use the first rule. For example, in the case of Minecraft Bedrock Edition, it uses UDP protocol on port 19132, so mapping this port is sufficient. You can search for your current public IP address on Google. Actually, dynamic IPs won't change that frequently.

The scope of renting a server is even broader. First, you need to consider whether to choose a domestic server (China) or an overseas server. The advantage of domestic servers is their proximity, resulting in lower latency (for China user). However, the disadvantages are quite evident; domestic servers are very expensive compared to foreign servers with similar specifications, and there's the issue of bandwidth. The bandwidth of a domestic 1Mbps server is simply unbelievable. Foreign servers often have higher latency, but they have many other advantages. Firstly, they are cheaper, and they offer abundant bandwidth options, such as 500Mbps, 1Gbps, and 2Gbps, which are quite common. Server providers you might encounter usually include Tencent Cloud, Alibaba Cloud, Oracle, Amazon Web Services, and so on.

Oracle provides free servers, but they are difficult to obtain. Errors often occur after the credit card verification is completed in the final step. My advice is to use genuine information, avoid using proxies, and make sure the address you provide matches your credit card address and IP. Also, it seems that due to the amount of people in China, it's very difficult to get an account with a Chinese Credit card. I failed several times, but finally succeeded with an American credit card. So, I recommend that people overseas give it a try.

The region you choose during registration is the region of the server. Free accounts cannot simultaneously open servers in multiple regions. If registration is successful, having this account is quite valuable. You can simultaneously use two 1-core 1GB RAM AMD servers (bandwidth: 480Mbps) and one 4-core 24GB RAM ARM server (bandwidth: 2Gbps) or two 2-core 12GB ARM servers (bandwidth: 1Gbps). I chose the Osaka region in Japan, and perhaps because it's so popular, there was no inventory for ARM servers. However, two AMD servers are already very comfortable. For such servers, Linux becomes the primary choice, as Windows Server not only consumes performance but is also a paid service.

## Installing the Bedrock Edition Server

OS: Ubuntu Server 22.04.2 LTS

1. Setup a server through the server provider and install the Ubuntu system. Save the private key. (release port 22)
2. Install Tabby on the computer, which is an open source terminal. It can be downloaded on GitHub.
3. Connect to the server through SSH. Check the user name according to the server background panel, usually 'ubuntu'.
   ![Image text](https://i0.hdslb.com/bfs/article/8db1d7c915e742c223216eecf6c573b41d7cc65f.png@1256w_934h_!web-article-pic.webp)
4. Wait for the connection to be successful and the preparations to be complete. (The picture below is the LAN connection to my virtual machine, for demonstration purposes only)
   ![Image text](https://i0.hdslb.com/bfs/article/68c3a650d420de412184bede26a0edf6f5b4e289.png@1256w_1344h_!web-article-pic.webp)
5. Get administrator privileges.
   ```
   sudo passwd root
   su root
   ```
   ![Image text](https://i0.hdslb.com/bfs/article/16aa9db060eaf575dc79f0b6e723328d497fe698.png@!web-article-pic.webp)
6. Update package list
   ```
   sudo apt-get update
   ```
7. Install compression and decompression software
   ```
   apt-get install zip
   ```
   (In this system version , zip and unzip will be installed at the same time)

   ```
   apt-get install unzip
   ```
   (This is not necessary in this system version)
8. This system version comes with screen (software that keeps the program running after ssh is closed), no additional installation is required.
   ```
   apt-get install screen
   ```
   (Not necessary)
9. Install the server-side network communication dependency library
   ```
   apt-get install libcurl4-openssl-dev
   ```
   (Important and indispensable! !)
10. Create a new server folder
    ```
    cd /home
    mkdir minecraft
    cd ./minecraft
    ```
    (open home folder,Create a new folder named minecraft,open the minecraft folder)
11. Download the Bedrock Edition server ```wget link``` link from the official website as follows
    ![Image text](https://i0.hdslb.com/bfs/article/716ce17e27d827dce933f35a6ef46b98090a6e3b.png@1256w_1076h_!web-article-pic.webp)
12. unzip file ```unzip filename``` Check the file name through ```ls```, or directly press TAB to complete it automatically.
    ![Image text](https://i0.hdslb.com/bfs/article/02f7e0c7e6e88173891c66d1e11304a632b84f8b.png@!web-article-pic.webp)
13. To delete the compressed package, use this command ```rm ./filename```
14. Prevent Minecraft server from being shut down after closing the ssh connection. Create a new virtual window named minecraft ```screen -S minecraft```. case matters
15. Run the game ```LD_LIBRARY_PATH=. ./bedrock_server``` Make sure you are in the correct server directory when running this command.
    ![Image text](https://i0.hdslb.com/bfs/article/09dcb8bc7352c409c6bb0acf96273a581a7f6e6e.png@1256w_692h_!web-article-pic.webp)
16. If you cannot connect to the server, remember to check whether the server operator background management interface has released the 19132 udp port. Or it was blocked by the system firewall (generally speaking, the new system does not have a firewall by default). For details, please refer to the Commands and Usage Section.
17. CTRL-C closes the server

## Bedrock Edition Server Configuration

There are mainly three files that the can modify: allowlist.json, permissions.json, and server.properties. The first is the whitelist, which is rarely used. The second file is to give permissions, and add whatever is needed. The third is to modify the parameters of the server. You can set parameters such as seeds and server types and it is easy to find its meaning online. 

![Image text](https://i0.hdslb.com/bfs/article/ee8965558b93c59910fb7e4302f88da9941c3f47.png@!web-article-pic.webp)

Modifying these files requires the **vim** tool.

Open the file with ```vim ./permissions.json```. When you first open it, you can copy and paste, but you cannot edit it. Press 'i' to enter edit mode and 'Esc' to exit edit mode.

```:wq``` save and quit ```:q!``` do not save and force to quit

## Setting up Scheduled Backups

As a server, scheduled automatic backups are a crucial part of this. This backup method is suitable for servers with ample memory and doesn't involve hot backups. I referred to online tutorials and made some modifications to the script myself.

1. Rebooting the system ```sudo reboot```
2. Switching to the root user ```su root```
3. Opening the server folder ```cd /home/minecraft```
4. Creating a new script file with .sh extension ```vim autoBackup.sh```
5. Paste the script
```
mkdir -p /home/minecraft/backup

find /home/minecraft/backup -mtime +14 -type f -name "*.zip" -exec rm -rf {} \; 

sleep 2

mkdir -p /home/minecraft/backup/temp        

echo 'mkdir done' 

mkdir -p /home/minecraft/backup/temp/mcserver

cp -r /home/minecraft/worlds/* /home/minecraft/backup/temp/mcserver

sleep 2

echo 'copy done'

zip -q -r /home/minecraft/backup/mcserver$(date +%Y%m%d).zip /home/minecraft/backup/temp/mcserver

echo 'zip done' 

sleep 2

rm -rf /home/minecraft/backup/temp

echo 'all done'

exit
```
![Image text](https://i0.hdslb.com/bfs/article/74fd57f2052823288010504f4b78a82238eaa3fc.png@1256w_598h_!web-article-pic.webp)

6. Set the format to Unix, or you may encounter errors later. ```:set fileformat=unix```
7. Save and exit ```:wq```
8. Give execute permissions to the script ```chmod +x autoBackup.sh```
9. Test it ```./autoBackup.sh```. You should see the following screen, then use the ```ls``` command to check if the zip file has been generated. If you're using the Tabby software I recommended, you can go to the top right corner of the software, click on SFTP, and check if the backup file has been generated."

![Image text](https://i0.hdslb.com/bfs/article/c71689e0ffb45aa48a144b9b1cd1a69cdbaa8206.png@1256w_380h_!web-article-pic.webp)

![Image text](https://i0.hdslb.com/bfs/article/bf38e772d6b47c49003f8b8c765e26ef529dd3f1.png@1256w_302h_!web-article-pic.webp)

10. After these successful setup, it's time to configure the scheduled task.
11. Open the cron job editor, select option 1 ```crontab -e```
12. Enter this command to run the script at 3 AM every day.

![Image text](https://i0.hdslb.com/bfs/article/e1982cb4c9b925591c7037d6edf0061f9192b8cc.png@1256w_142h_!web-article-pic.webp)

13. Press F2, then Y to save, and Enter to exit.

## Setting up Scheduled Shutdowns and Backups




