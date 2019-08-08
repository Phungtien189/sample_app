# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Login logout -devise 
login by uid 
crud company dùng form object(virtus)
phân trang
dùng template admin(core ui)
search ransach company
có nút reset input 

<tr>
  <td><%= link_to company.name, company_path(company) %></td>
  <td><%= link_to t(".delete"), company_path(company), method: :delete, data: {confirm: t(".you_sure")} %>
  </td>
  <td><%= link_to t(".edit_company"), edit_company_path(company) %></td>
</tr>
