private double fractionLength = .8;
private int smallestBranch = 5;
private double branchAngle = .4;

public void setup() {
    size(640, 480);
    noLoop();
}

public void draw() {
    background(0);
    drawBranches(320, 480, 100, 3 * Math.PI / 2, 10); 
}

public void drawBranches(int x, int y, double branchLength, double angle, float strokeWeight) {

    if (branchLength < smallestBranch * 8) {
        stroke(255, 183, 197); 
    } else {
        stroke(139,69,19); 
    }
    
    strokeWeight(strokeWeight);

    double angle1 = angle + branchAngle;
    double angle2 = angle - branchAngle;

    branchLength *= fractionLength;

    int endX1 = (int) (branchLength * Math.cos(angle1) + x);
    int endY1 = (int) (branchLength * Math.sin(angle1) + y);
    int endX2 = (int) (branchLength * Math.cos(angle2) + x);
    int endY2 = (int) (branchLength * Math.sin(angle2) + y);

    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);

    if (branchLength > smallestBranch) {
        drawBranches(endX1, endY1, branchLength, angle1, strokeWeight * 0.7); 
        drawBranches(endX2, endY2, branchLength, angle2, strokeWeight * 0.7);
    } 
}
