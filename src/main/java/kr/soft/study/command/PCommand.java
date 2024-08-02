package kr.soft.study.command;

import java.util.Map;

public interface PCommand {
	
    String execute(Map<String, Object> map);

	String useExecute(Map<String, Object> map);
}
