package model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface BoardCommand<T> {
    T execute(HttpServletRequest request, HttpServletResponse response);
}