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

# Select a Server

There are a lot of available options on selecting a server, and here are some suggestions. Firstly, the server's hardware configuration determines both the number of simultaneous online players and the loading speed of maps. When I talk about hardware configuration, I am referring to the number of CPU cores, the amount of memory, and the server's bandwidth. Of course, the higher the configuration, the better it would be (haha, if you have the budget ^_^). However, through testing, it has been found that 1 core with 1GB of memory (1 core 1GB) can also provide a smooth gaming experience, although there is a chance of running out of memory. In cases with limited memory, it is strongly recommended to schedule regular server restarts, as this effectively clears the memory.

Another point to note is that if you are renting a server, it's essential to choose one that is geographically close to your physical location. This helps reduce in-game latency, particularly noticeable in the speed of terrain generation after teleportation within the game.
