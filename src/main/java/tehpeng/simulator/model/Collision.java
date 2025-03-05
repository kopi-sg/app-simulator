package tehpeng.simulator.model;

import java.util.List;

public class Collision {
  private String currentCar;
  private int step;
  private List<String> collidedCar;
  private Integer[] coordinate;

  public Collision(String currentCar, int step, List<String> collidedCar, Integer[] coordinate) {
    this.currentCar = currentCar;
    this.step = step;
    this.collidedCar = collidedCar;
    this.coordinate = coordinate;
  }

  public String getCurrentCar() {
    return currentCar;
  }

  public int getStep() {
    return step;
  }

  public List<String> getCollidedCar() {
    return collidedCar;
  }

  public Integer[] getCoordinate() {
    return coordinate;
  }

}
