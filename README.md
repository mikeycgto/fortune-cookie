## HTTP Fortune Cookies

**Fortune Cookie:** *"A thin folded cookie containing a slip of paper with a prediction or aphorism written on it, served in Chinese restaurants."*

### Usage

To get a cookie do something like the following:

    curl -I https://http-fortune-cookie.herokuapp.com

### In the Browser (with CORS)

You can get a fortune by making an XHR request from the browser. This
is only possible in browsers that support CORS.

For example:

    var xhr = new XMLHttpRequest;
    
    xhr.open('GET', 'http://http-fortune-cookie.herokuapp.com', true);
    xhr.send();

    xhr.onreadystatechange = function(){
      if (xhr.readyState == 4) alert(xhr.response);
    };


### Credits

Credit for the actual fortune text goes to the original creators of the
UNIX Fortune Cookie program. I have no idea who that is though. Here's a
link: ftp://sunsite.unc.edu/pub/Linux/games/amusements/fortune/!INDEX.html
