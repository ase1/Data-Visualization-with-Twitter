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

1. Go to the Processing website, https://processing.org/ ![processing_website](images/processing_website.png)

2. Click "Download Processing". You don't have to donate, but you can if you want. ![download_processing](images/download_processing.png)

3. Unzip and extract Processing to a convenient location. There is no installation required. ![processing_folder](images/processing_folder.png)

4. Run processing.exe. After a splash screen, you should see the sketch window. ![processing_sketch](images/processing_sketch.png) 

Let's get acquainted with some of Processing's features. You'll notice in the top right there's a little box specifying that the current language is Java. Under the file menu, there's a toolbar with buttons to run, stop, create a new file, open, save, and export the application. You write your code in the text editor, and there's a console at the bottom. 

Processing comes built in with a plethora of sweet examples that can be accessed by going to File > Examples... Feel free to peruse these and see some of the things you can easily do with the software. 

As far as coding goes, Processing has two extra-important functions, setup(), and draw(). Since Processing is focused on creating visuals, both of these functions should be present in every application. If they aren't, Processing will do its best, but things might get sticky. 

So without further ado, let's write our first application, the classic Hello World. 

>void setup()

>{

>print("Hello World");

>}

>void draw()

>{

>}

![hello_world](images/hello_world.png)

Neat! You'll notice that a cute little gray box appeared next to the development pane. **This is the window in which things will be drawn!** Right now, we're just printing things to the console so nothing is there, but we'll learn some tools to make the magic happen. 


<a name="Twitter Intro">
## Getting Started with the Twitter API ##

Now that you know the basics of Processing, let's connect it to Twitter! There's a little bit of setup for this too, so hold tight. Make sure you have a Twitter account, because you need one to access the dev tools. 

1. Go to https://apps.twitter.com/ and log in. 
![twitter_apps](images/twitter_apps.png)
2. Create a new app using the "Create New App" button. 
3. Fill out the fields however you like, it's not super important. We're after some authorization credentials that Twitter assigns to each app, but it doesn't matter what you write in the fields. 
![twitter_create](images/twitter_create.png)
4. Once you agree to the terms and create the app, navigate to "Keys and Access Tokens". We need four strings from this page to gain access to all of Twitter. I Captcha-d my credentials so you guys don't tweet dirty things on my behalf. 
![keys_and_access_tokens](images/keys_and_access_tokens.png)
5. Click the "Create my Access Token" button. Proceed. 
![create_my_access_token](images/create_my_access_token.png)
6. Click "Test OAuth" at the top, and hold on to those four strings. They're important. 
![test_oauth](images/test_oauth.png)
7. Twitter is all set up! We're ready to make our app. 

<a name="Import Library">
## Importing the Twitter4J Library ##
We now need a library to help Java interact with Twitter. There's a very handy *unofficial* Java library called [Twitter4J](http://twitter4j.org/en/index.html). 
![twitter4_website](images/twitter4j_website.png)

Go to the Twitter4J website, download the latest stable version, and unzip to a folder. 
![twit4j_folder](images/twit4j_folder.png)

In the "lib" subfolder, you'll see a couple *.jar* files. We need these so keep them handy. 

<a name="Visualizing Data">
## Visualizing Data ##

So now that the easy stuff is done, we have to think of something to try to visualize. Twitter's often used for sports updates, because it's lightning-quick and people have nothing better to talk about. **Let's see if we can visualize the popularity of different sports!** 

![gosports](images/gosports.jpg)

First things first, we need to import the Twitter4J library into Processing. This is super easy, just drag those *twitter4j-XXXX-4.0.2.jar* files into the Processing Window. The message pane in Processing will tell you that six files were added to the sketch. 
![import_t4j](images/import_t4j.png)

Now, let's get Twitter's resources into Processing. We need four static Strings: *OAuthConsumerKey*, *OAuthConsumerSecret*, *AccessToken*, and *AccessTokenSecret*. These do not have to be defined within any function. 
In addition to the strings, we need a TwitterStream object to receive tweets. This also goes with the config variables. 
>TwitterStream twitter = new TwitterStreamFactory().getInstance();
![input_keys](images/input_keys.png)

Also, before we get ahead of ourselves, let's save our work. 

Now, in the setup() function, we need to tell our application to connect to Twitter and to receive data. We do this using a *listener*. 
>void setup()

>connectTwitter();

>twitter.addListener(listener);

We also need a couple lines of code at the bottom to define these functions and use the credentials. It's easiest to just copy and paste these. 

>// Initial connection

>void connectTwitter() {

>  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);

>  AccessToken accessToken = loadAccessToken();

>  twitter.setOAuthAccessToken(accessToken);

>}

>// Loading up the access token

>private static AccessToken loadAccessToken() {

>  return new AccessToken(AccessToken, AccessTokenSecret);

>}

>// This listens for new tweet

>StatusListener listener = new StatusListener() {

>  public void onStatus(Status status) {}

>  public void onStallWarning(StallWarning stallwarning){}

>  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}

>  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}

>  public void onScrubGeo(long userId, long upToStatusId) {

>    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);

>  }

>  public void onException(Exception ex) {

>    ex.printStackTrace();

>  }

>};
