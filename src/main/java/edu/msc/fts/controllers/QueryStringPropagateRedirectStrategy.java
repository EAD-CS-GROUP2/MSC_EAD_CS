package edu.msc.fts.controllers;

import org.springframework.security.web.DefaultRedirectStrategy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by harshadura on 8/23/15.
 */
public class QueryStringPropagateRedirectStrategy extends DefaultRedirectStrategy {

    public void sendRedirect(HttpServletRequest request,
                             HttpServletResponse response, String url) throws IOException {
//        String urlWithOriginalQueryString = url + "?" + request.getQueryString();
        String urlWithOriginalQueryString = url + "?auth=fail";

        super.sendRedirect(request, response, urlWithOriginalQueryString );
    }

}
