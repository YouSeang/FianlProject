package kr.soft.study.command;

import java.util.Map;

public interface CCommand {
    String execute(Map<String, Object> map);
}
