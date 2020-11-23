lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-03.glade')

prov = gtk.CssProvider()
prov:load_from_path('/home/alex/Документы/3/test.css')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

rb = {ui.rb_a, ui.rb_b, ui.rb_c, ui.rb_d, ui.rb_e, ui.rb_f, ui.rb_g, ui.rb_h}

function update()
	x = 0
	y = 0
	z = 0
	if ui.ck_x.active == true then x = 1 end
	if ui.ck_y.active == true then y = 1 end
	if ui.ck_z.active == true then z = 1 end 


	v = (x + y * 2) + (z * 3)
	rb[v + 1].active = true

	ui.lbl_val.label = v
end

function ui.ck_x:on_clicked(...)
	update()
end

function ui.ck_y:on_clicked(...)
	update()
end

function ui.ck_z:on_clicked(...)
	update()
end

ui.wnd.title = 'lab-03'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()
gtk.main()
