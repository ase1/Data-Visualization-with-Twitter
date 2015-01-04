<a name="Title" />
# Data Visualization with Processing and Twitter API #

<a name="Overview" />
## Overview ##

![twitter_globe](images/twitter_globe.jpg?raw=true)

The Internet is home to an almost insurmountable amount of raw data. While humans are great at a lot of things like [riding bikes] (http://damien.pobel.fr/images/backflip-qui-part-mal-en-bmx-street.jpg) and [depleting Earth's natural resources] (http://upload.wikimedia.org/wikipedia/commons/0/05/Coal_mine_Wyoming.jpg), we aren't so great at parsing a lot of data. Luckily, computers are really good at parsing and sorting lots of data. We can even ask computers to process that data and output a result that is significant to us. 

We'll use [Twitter](http://twitter.com) as our source of data, since Twitter's always happening and it has a pretty intuitive API. For the uninitiated, Twitter is a social networking service that allows users to post short messages for the world to see. We can grab the public tweets from all of Twitter's users, sort and filter the tweets, and get the information we desire. This information could be useful for any sort of study that requires a lot of subjects, but on top of that, it's usually pretty interesting just to look at. Considering that there's somewhere between 5,000 and 10,000 tweets sent every second, it's easy to see that we have plenty to work with. 

We'll also use [Processing](https://processing.org/), an open-source development environment that makes it easy to produce visuals. It defaults to Java, but there are other modes that can be downloaded for other applications. Because most intro Computer Science classes use Java, we'll stick to that for now. 

<!--- For other examples of data visualizations, I suggest you check out the [DataIsBeautiful Subreddit](http://www.reddit.com/r/dataisbeautiful). It's a great community and can spark inspiration for projects. Do something awesome. --->

<a name="Processing Intro">
## Getting Started with Processing ##

We have some work to do before we can begin the fun. You have to eat your vegetables before dessert. Let's set up Processing. 

1. Go to the Processing website. https://processing.org/ ![processing_website](images/processing_website.png)
2. Click "Download Processing". You don't have to donate, but you can if you want. ![download_processing](images/download_processing.png)
3. Unzip and extract Processing to a convenient location. There is no installation required. ![processing_folder](images/processing_folder.png)
4. Run processing.exe. After a splash screen, you should see the sketch window. ![processing_sketch](images/processing_sketch.png) 
Let's get acquainted with some of Processing's features. You'll notice in the top right there's a little box specifying that the current language is Java. Under the file menu, there's a toolbar with buttons to run, stop, create a new file, open, save, and export the application. You write your code in the text editor, and there's a console at the bottom. 

Processing comes built in with a plethora of sweet examples that can be accessed by going to File > Examples... Feel free to peruse these and see some of the things you can easily do with the software. 

As far as coding goes, Processing has two extra-important functions, setup(), and draw(). Since Processing is focused on creating visuals, both of these functions should be present in every application. If they aren't, Processing will do its best, but things might get sticky. 

So without further ado, let's write our first application, the classic Hello World. 

>void setup()
>{
>  print("Hello World");
>}
>
>void draw()
>{
>  
>}

![hello_world](images/hello_world.png)

Neat! You'll notice that a cute little gray box appeared next to the development pane. This is the window in which things will be drawn! Right now, we're just printing things to the console so nothing is there, but we'll learn some tools to make the magic happen. 