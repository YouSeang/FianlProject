package kr.soft.study.dto;

public class Game {
    private int[] holes;
    private int score;
    private int time;
    private boolean started;

    public Game() {
        this.holes = new int[9]; // 9 holes
        this.score = 0;
        this.time = 60;
        this.started = false;
    }

    public int[] getHoles() {
        return holes;
    }

    public int getScore() {
        return score;
    }

    public void incrementScore() {
        this.score++;
    }

    public int getTime() {
        return time;
    }

    public void decrementTime() {
        this.time--;
    }

    public boolean isStarted() {
        return started;
    }

    public void start() {
        this.started = true;
    }

    public void reset() {
        this.holes = new int[9];
        this.score = 0;
        this.time = 60;
        this.started = false;
    }
}
