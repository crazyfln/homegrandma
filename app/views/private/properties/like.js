$link   = $("#listing-like-<%=  @property.id %>");
$link2  = $("#grid-listing-like-<%=  @property.id %>");
$link3  = $("#detail-listing-like-<%=  @property.id %>");
$sup    = $link.closest('sup')
$sup2   = $link2.closest('sup')
$small  = $link3.closest('small')

<% if @success %>
  <% if @status == 'like' %>
    $sup.addClass('active');
    $sup2.addClass('active');
    $small.addClass('active')

  <% else %>
    $sup.removeClass('active');
    $sup2.removeClass('active');
    $small.removeClass('active')

  <% end %>
<% end %>
