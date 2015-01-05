static String OAuthConsumerKey = "[YOUR_CREDENTIALS_HERE]";
static String OAuthConsumerSecret = "[YOUR_CREDENTIALS_HERE]";
static String AccessToken = "[YOUR_CREDENTIALS_HERE]";
static String AccessTokenSecret = "[YOUR_CREDENTIALS_HERE]";
TwitterStream twitter = new TwitterStreamFactory().getInstance(); 

int width = 1366;
int height = 768;

String team1 = "Lions";
String team2 = "Cowboys";
int team1counter = 0;
int team2counter = 0;
color team1color = color(0,109,176);
color team2color = color(0, 34, 68);


PFont f;
PImage img;
void setup()
{
  connectTwitter();
  twitter.addListener(listener);
  
String keywords[] = {team1, team2};
  twitter.filter(new FilterQuery().track(keywords));

  size(width, height);
  f = createFont("Segoe UI", 48);
  textFont(f);
  background(color(0,0,0));
}

void draw()
{
  fill(color(40,40,40));
  rect(width*0, height*.05, width*.4, height*.1);
  rect(width*.6, height*.05, width*1, height*.1);
  fill(color(255,255,255));
  text(team1, width*.15, height*.125);
  text(team2, width*.75, height*.125);
  
  double percent = (double)team1counter / (team1counter+team2counter+1);  //+1 to avoid div by zero
  fill(team1color);
  rect(width*0, height*.25, (int)(width*percent), height*.4);
  fill(team2color);
  rect((int)(width*percent), height*.25, width*1, height*.4);
  
  fill(team2color);
  text(Double.toString(round((float)percent*1000)/(double)10)+"%", (int)(percent*width/2.5), (int)height*.47);
  fill(team1color);
  text(Double.toString(100-round((float)percent*1000)/(double)10)+"%", width-(int)((1-percent)*width/1.9), (int)height*.47);
}


// Initial connection
void connectTwitter() {
twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
AccessToken accessToken = loadAccessToken();
twitter.setOAuthAccessToken(accessToken);
}
// Loading up the access token
private static AccessToken loadAccessToken() {
return new AccessToken(AccessToken, AccessTokenSecret);
}

// This listens for new tweet
StatusListener listener = new StatusListener() {
  public void onStatus(Status status) {
    if (status.getText().indexOf(team1)!= -1)
    {
      team1counter++;
      image(loadImage((status.getUser().getMiniProfileImageURL())), (int)random(width*.45), height-(int)random(height*.4));
    }
    if (status.getText().indexOf(team2)!= -1) 
    {
      team2counter++;
      image(loadImage((status.getUser().getMiniProfileImageURL())), width-(int)random(width*.45), height-(int)random(height*.4));
    } 
  }
  public void onStallWarning(StallWarning stallwarning){}
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}
  public void onScrubGeo(long userId, long upToStatusId) {
  System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }
  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};
