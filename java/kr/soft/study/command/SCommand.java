package kr.soft.study.command;

import java.util.Map;

public interface SCommand {
    void execute(Map<String, Object> map);
}
