package com.bugtriage.models;

public class Performance {
    private int id;
    private String metric;
    private double value;

    public Performance() {}

    public Performance(int id, String metric, double value) {
        this.id = id;
        this.metric = metric;
        this.value = value;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getMetric() { return metric; }
    public void setMetric(String metric) { this.metric = metric; }

    public double getValue() { return value; }
    public void setValue(double value) { this.value = value; }
}