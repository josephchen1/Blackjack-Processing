import java.util.ArrayList;
Deck deck = new Deck(); // creates new Deck 
ArrayList<Card> you = new ArrayList<Card>(); // creates ArrayList of cards for player
ArrayList<Card> dealer = new ArrayList<Card>(); // creates ArrayList of cards for dealer
boolean hitdelay = true; 
int cardnumber = 4;
boolean game = true;
int win = 0;
int loss = 0;
PImage restart;


void setup() {
  deck.shuff();
  background(71, 113, 72);
  size(650, 400);
  st(deck, dealer, you);
  fill(56, 102, 76);
  board();
  restart = loadImage("restart.png");
  imageMode(CENTER);
  image(restart, 625, 25);
}
void draw() {
  for (int i = 0; i<you.size(); i++) {
    you.get(i).display(150+(i*70), 300);
  }
  for (int i = 0; i<dealer.size(); i++) {
    if (game == true) {
      if (i < 1) {
        dealer.get(i).display(150+(i*70), 100);
      } else {
        dealer.get(i).blank(150+(i*70), 100);
      }
    } else {
      dealer.get(i).display(150+(i*70), 100);
    }
  }
  if (getScore(dealer)<17) {
    hitdealer(deck, dealer);
    if (getScore(dealer)>=21) {
      result(getScore(you), getScore(dealer));
      ending(dealer, you);
    }
  }
  if (getScore(you)>=21 && game == true) {
    result(getScore(you), getScore(dealer));
      ending(dealer, you);
  }
  if (game == false && mousePressed==true && hitdelay == true 
    && mouseX>550&&mouseY<50) {
    restart();
    game = true;
  }
  if (game == true && mousePressed==true && hitdelay == true 
    && mouseX>255-60 && mouseX<225+60 && mouseY>200-25 && mouseY<200+25) {
    hitdelay=false;
    hit(deck, you);
  }
    
  if (game == true && mousePressed == true && hitdelay == true 
    && mouseX>422-60 && mouseX<422+60 && mouseY>200-25 && mouseY<200+25) {
    result(getScore(you), getScore(dealer));
    ending(dealer, you);
  }
}
void mouseReleased() {
  hitdelay = true;
}

void hitdealer(Deck deck, ArrayList<Card> d) {
  if (getScore(d)<17) {
    d.add(deck.dealCard(cardnumber));
    cardnumber++;
  }
}
void hit(Deck deck, ArrayList<Card> y) {
  if (getScore(y) < 22) {
    y.add(deck.dealCard(cardnumber));
    cardnumber++;
  }
}

void st (Deck deck, ArrayList<Card> d, ArrayList<Card> y) {
  y.add(deck.dealCard(0)); //deals cards
  d.add(deck.dealCard(1));
  y.add(deck.dealCard(2));
  d.add(deck.dealCard(3));
}

void ending (ArrayList<Card> d, ArrayList<Card> y) {
  fill(255);
  textSize(16);
  textAlign(LEFT);
  text("Your points: " + getScore(y), 10, 180);
  text("Dealer's points: " + getScore(d), 10, 220);
  text("Wins: "+win, 560, 180);
  text("Losses: "+loss, 560, 220);
  game = false;
}

void result(int y, int d) {
  fill(255);
  textSize(32);
  textAlign(CENTER);
  if (d > 21 && y <= 21) {
    text("You win! Dealer loses!", 325, 380);
    win++;
  } else if (y > 21 && d <= 21) {
    text("Dealer wins! You lose!", 325, 380);
    loss++;
  } else if (d > y) {
    text("Dealer wins! You lose!", 325, 380);
    loss++;
  } else if (d == y) {
    text("Tie! No winner!", 325, 380);
  } else if (d > 21 && y > 21) {
    text("Tie! No winner!", 325, 380);
  } else if (d < y) {
    win++;
    text("You win! Dealer loses!", 325, 380);
  }
}

int getScore(ArrayList<Card> input) {
  int points = 0;
  for (int i = 0; i < input.size(); i++) {

    points += input.get(i).getPoints();
  }
  return points;
}

void board() {
  rectMode(CENTER);
  rect(150, 300, 50, 80);
  rect(220, 300, 50, 80);
  rect(290, 300, 50, 80);
  rect(360, 300, 50, 80);
  rect(430, 300, 50, 80);
  rect(500, 300, 50, 80);

  rect(150, 100, 50, 80);
  rect(220, 100, 50, 80);
  rect(290, 100, 50, 80);
  rect(360, 100, 50, 80);
  rect(430, 100, 50, 80);
  rect(500, 100, 50, 80);

  rect(625, 25, 50, 50);
  rect(255, 200, 120, 50);
  rect(422, 200, 120, 50);
  fill(212, 175, 55);
  textAlign(LEFT);
  textSize(32);
  text("HIT", 230, 210);
  text("STAND", 370, 210);
}

void restart() {
  you.clear();
  dealer.clear();
  deck.shuff();
  background(71, 113, 72);
  fill(56, 102, 76);
  board();
  st(deck, dealer, you);
  imageMode(CENTER);
  image(restart, 625, 25);
}
