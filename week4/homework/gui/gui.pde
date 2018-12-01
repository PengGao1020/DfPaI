import controlP5.*;

ControlP5 cp5;

int backgroundR=100;
int backgroundG=100;
int backgroundB=100;
float radius=120;
int positionX;
int positionY;

void setup() {
  size(500, 500);

  cp5 = new ControlP5(this);

  cp5.enableShortcuts();

  cp5.setColorBackground(color(102, 131, 213));
  cp5.setColorForeground(color(89, 148, 74));
  cp5.setColorActive(color(89, 148, 74));


  cp5.addSlider("radius")
    .setPosition(20, 60)
    .setSize(150, 10)
    .setRange(10, 250)
    .setColorValue(color(200, 100, 155))
    .setColorLabel(color(200, 100, 155))
    ;

  cp5.getController("radius").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("radius").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

  cp5.addSlider("backgroundR")
    .setPosition(20, 20)
    .setSize(100, 10)
    .setRange(50, 200)
    .setCaptionLabel("R")
    ;

  cp5.addSlider("backgroundG")
    .setPosition(20, 30)
    .setSize(100, 10)
    .setRange(50, 200)
    .setCaptionLabel("G")
    ;

  cp5.addSlider("backgroundB")
    .setPosition(20, 40)
    .setSize(100, 10)
    .setRange(50, 200)
    .setCaptionLabel("B")
    ;


  Group g1 = cp5.addGroup("position")
    .setPosition(20, 100)
    .setWidth(150)
    .setBackgroundHeight(20)
    .setColorActive(color(200, 100, 155))
    .setColorForeground(color(200, 100, 155))
    .setColorBackground(color(200, 100, 155))
    .hideArrow()
    ;

  cp5.addSlider("positionX")
    .setPosition(0, 0)
    .setSize(150, 10)
    .setRange(0, width)
    .setGroup(g1)
    .setLabelVisible(false)
    .setValue(250)
    ;

  cp5.addSlider("positionY")
    .setPosition(0, 10)
    .setSize(150, 10)
    .setRange(0, height)
    .setGroup(g1)
    .setLabelVisible(false)
    .setValue(250)
    ;
}

void draw() {
  background(backgroundR, backgroundG, backgroundB);

  ellipse(positionX, positionY, radius*2, radius*2);
  
  String tip="Hold Alt to drag the controller.";
  text(tip,20,480);
}
