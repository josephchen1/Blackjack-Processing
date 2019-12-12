PImage diamonds;
PImage hearts;
PImage clubs;
PImage spades;

public class Card {
  // declaring constants
  public final String[] FACES = { "0", "A", "2", "3", "4", "5", "6", "7", "8", 
    "9", "10", "J", "Q", "K" };
  private final String[] SUITS = { "HEARTS", "DIAMONDS", "SPADES", "CLUBS" };

  // instance variables
  private String suit;
  private String face;
  private int value;
  // constructors
  public Card() {
    // random index between 1 and 13 (then 0 and 3) inclusive
    // set instance variables
    value = (int) (Math.random() * (FACES.length - 1) + 1);
    face = FACES[value];
    suit = SUITS[(int) (Math.random() * SUITS.length)];
  }

  public Card(int f, int s) {
    face = FACES[f];
    suit = SUITS[s];
    value = f;
  }

  // methods
  // setters
  public void setSuit(String s) {
    for (int i = 0; i < SUITS.length; i++) {
      if (s.equalsIgnoreCase(SUITS[i])) {
        suit = SUITS[i];
      }
    }
  }
  public void blank(int x, int y) {
    fill(255);
    rectMode(CENTER);
    rect(x, y, 50, 80);
  }
  public void display(int x, int y) {
    diamonds = loadImage("diamond.png");
    hearts = loadImage("hearts.png");
    clubs = loadImage("clubs.jpg");
    spades = loadImage("spades.jpg");
    fill(255);
    rectMode(CENTER);
    rect(x, y, 50, 80);
    textSize(20);
    textAlign(CENTER);
    fill(0);
    imageMode(CENTER);
    if (suit == "DIAMONDS") {
      image(diamonds, x, y+10);
    } else if (suit == "HEARTS") {
      image(hearts, x, y+10);
    } else if (suit == "CLUBS") {
      image(clubs, x, y+10);
    } else if (suit == "SPADES") {
      image(spades, x, y+10);
    }
    text(face, x, y-13);
  }
  public void setFace(String f) {
    for (int i = 1; i < FACES.length; i++) {
      if (f.equalsIgnoreCase(FACES[i])) {
        face = FACES[i];
        value = i;
      }
    }
  }

  // getters
  public String getFace() {
    return face;
  }

  public String getSuit() {
    return suit;
  }

  public int getPoints() {
    if (value > 10) {
      return 10;
    } else if (value == 1) {
      return 11;
    }
    return value;
  }

  public String toString() {
    return face + " of " + suit;
  }
}
