# Minecraft Bedrock Server Tutorial
Minecraft Bedrock Edition server setup (Ubuntu Server)

My orignal article was published on BiliBili. Link: https://www.bilibili.com/read/cv25659542

This article will start from scratch to explain the process and all the details of setting up a "Minecraft Bedrock Edition" server. I have always believed that only a server you own is a reliable server. So, I spent a few days tinkering with this, and the main purpose of writing this article is also a memo to prevent myself from forgetting. Before I begin, I need to emphasize that this Bedrock Edition server only supports X86/X64 architecture CPUs and does not support ARM architecture. In other words, this server cannot be hosted on a Raspberry Pi. Below is the table of contents for this article.

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

!(https://i0.hdslb.com/bfs/article/5c21da8ec79cace90b66d3749acc6cbef06f3594.png@1256w_892h_!web-article-pic.webp)

Here are several options to choose from. If only a few ports need to be forwarded, use the first rule. For example, in the case of Minecraft Bedrock Edition, it uses UDP protocol on port 19132, so mapping this port is sufficient. You can search for your current public IP address on Baidu. Actually, dynamic IPs don't change too frequently.

The scope of renting a server is even broader. First, you need to consider whether to choose a domestic server or an overseas server. The advantage of domestic servers is their proximity, resulting in lower latency. However, the disadvantages are quite evident; domestic servers are very expensive compared to foreign servers with similar specifications, and there's the issue of bandwidth. The bandwidth of a domestic 1Mbps server is simply unbelievable. Foreign servers often have higher latency, but they have many other advantages. Firstly, they are cheaper, and they offer abundant bandwidth options, such as 500Mbps, 1Gbps, and 2Gbps, which are quite common. Server providers you might encounter usually include Tencent Cloud, Alibaba Cloud, Oracle, Amazon Web Services, and others.

Oracle provides free servers, but they are difficult to obtain. Errors often occur after the credit card verification is completed in the final step. My advice is to use genuine information, avoid using proxies, and make sure the address you provide matches your credit card address and IP. Also, it seems that due to aggressive actions in China, it's very difficult to get an account with a domestic card. I failed several times, and finally succeeded with an American credit card. So, I recommend that people overseas give it a try.

The region you choose during registration is the region of the server. Free accounts cannot simultaneously open servers in multiple regions. If registration is successful, having this account is quite valuable. You can simultaneously use two 1-core 1GB RAM AMD servers (bandwidth: 480Mbps) and one 4-core 24GB RAM ARM server (bandwidth: 2Gbps) or two 2-core 12GB ARM servers (bandwidth: 1Gbps). I chose the Osaka region in Japan, and perhaps because it's so popular, there was no inventory for ARM servers. However, two AMD servers are already very comfortable. For such servers, Linux becomes the primary choice, as Windows Server not only consumes performance but is also a paid service.

## Installing the Bedrock Edition Server

OS: Ubuntu Server 22.04.2 LTS

1. Open the server through the server provider and install the Ubuntu system. Save the private key. (release port 22)
2. Install Tabby on the computer, which is an open source terminal. It can be downloaded on GitHub.
3. Connect to the server through SSH. Check the user name according to the server background, usually ubuntu.
4. Wait for the connection to be successful and the preparations are complete. (The picture below is the LAN connection to my virtual machine, for demonstration purposes)
5. Get administrator privileges.
  ```
  sudo passwd root
  su root
  ```





