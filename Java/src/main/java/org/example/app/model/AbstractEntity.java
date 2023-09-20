package org.example.app.model;

public abstract class AbstractEntity implements Entity {
  private String id;

  public AbstractEntity(String id) {
    this.id = id;
  }

  public String getId() {
    return this.id;
  }

  public void setId(String id) {
    this.id = id;
  }
}
