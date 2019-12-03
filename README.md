.env file was not added to .gitignore because is needed to run devise, otherwhise it would be excluded from git

For sorting tweets, you can send sort param with the values asc or desc depending on which way you want to sort them, (sort=asc or sort=desc)

For paginating, per_page and page params must be sended as query params, otherwhise default values will be per_page: 20 and page: 1