import web
import json
import MySQLdb
import MySQLdb.cursors

urls = ('/','index','/art','art','/artData','artData_list','/artData/(.*)','artData')
render = web.template.render('templates/')

class index:
    def GET(self):
		return render.index()

class art:
	def GET(self):
		return render.art()

class artData_list:
	def GET(self):
		db = MySQLdb.connect("localhost","root","passw0rd1","veniceArt",cursorclass=MySQLdb.cursors.DictCursor)
		cursor = db.cursor()
		sql = "select artId as 'artId', artname as 'artName' from art"
		cursor.execute(sql)
		art = cursor.fetchall()
		return json.dumps(art)

class artData:
	def GET(self,artId):
		db = MySQLdb.connect("localhost","root","passw0rd1","veniceArt",cursorclass=MySQLdb.cursors.DictCursor)
		cursor = db.cursor()
		sql = "select artname as 'artName', artistName as 'artistName', " + \
				"buildingName as 'buildingName', notes as 'notes', latitude as 'latitude', longitude as 'longitude', image as 'image' from art a " + \
				"inner join artists ats on a.artistid = ats.artistid inner join " + \
				"buildings bld on a.buildingId = bld.buildingId where artId = " + artId
		cursor.execute(sql)
		art = cursor.fetchall()
		return json.dumps(art[0])

if __name__ == "__main__":
    app = web.application(urls, globals())
    app.run()
