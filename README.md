# Client-Side Forms Authentication Proof of Concept

A proof of concept demonstrating setting the [ASP.NET Forms
Authentication](https://msdn.microsoft.com/en-us/library/7t6b43z4(v=vs.140).aspx)
cookie from JavaScript in the browser.

The site has two buttons, each corresponding to a different approach:

- __Client-side Cookie__ — Hit a REST endpoint that returns the contents of
  what to set in a cookie, then create the cookie in JavaScript
- __Server-side Cookie__ — Send an XHR to an endpoint that sets the auth
  cookie in the response

Both approaches result in the user being logged in for all subsequent
requests.
