package model;

import java.sql.Timestamp;

public class BoardDTO {
    private int id;
    private String name;
    private String title;
    private String content;
    private Timestamp dateCreated;
    private int hit = 0;
    private int groupId;
    private int levelNum;
    private int indent = 0;
    private int pid = 0;

    public BoardDTO(int id, String name, String title, String content, Timestamp dateCreated,
            int hit, int groupId, int levelNum, int indent, int pid) {
        super();
        this.id = id;
        this.name = name;
        this.title = title;
        this.content = content;
        this.dateCreated = dateCreated;
        this.hit = hit;
        this.groupId = groupId;
        this.levelNum = levelNum;
        this.indent = indent;
        this.pid = pid;
    }

    public BoardDTO(String name, String title, String content, int groupId, int levelNum,
            int indent, int pid) {
        this.name = name;
        this.title = title;
        this.content = content;
        this.groupId = groupId;
        this.levelNum = levelNum;
        this.indent = indent;
        this.pid = pid;
    }

    public BoardDTO(String name, String title, String content, int groupId, int levelNum,
            int indent) {
        this.name = name;
        this.title = title;
        this.content = content;
        this.groupId = groupId;
        this.levelNum = levelNum;
        this.indent = indent;
    }

    public BoardDTO(String name, String title, String content, int groupId, int levelNum) {
        this.name = name;
        this.title = title;
        this.content = content;
        this.groupId = groupId;
        this.levelNum = levelNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }

    public int getHit() {
        return hit;
    }

    public void setHit(int hit) {
        this.hit = hit;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getLevelNum() {
        return levelNum;
    }

    public void setLevelNum(int levelNum) {
        this.levelNum = levelNum;
    }

    public int getIndent() {
        return indent;
    }

    public void setIndent(int indent) {
        this.indent = indent;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int sorting) {
        this.pid = sorting;
    }
}
