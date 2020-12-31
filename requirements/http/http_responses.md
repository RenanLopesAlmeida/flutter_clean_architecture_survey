# HTTP

## Success

1. ✅ Request with valid http verb (post)
2. Put the content type json in headers
3. Call request with correct body
4. Ok - 200 and answer with data
5. No content - 204 and answer without data

## Errors

1. Bad Request - 400
2. Unauthorized - 401
3. Forbidden - 403
4. Not Found - 404
5. Internal server error - 500

## Exception - Different status code from above
1. Internal server error - 500

## Exception - Http request returned some exception
1. Internal server error - 500

## Exception - Invalid http verb
1. Internal server error - 500