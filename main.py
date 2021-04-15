import os
from flask import Flask, render_template, request,redirect
from flask import session
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
import math

from werkzeug.utils import secure_filename

with open('config.json','r') as c:
    params = json.load(c)['params']
local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:Aditya@9457@localhost/testdb" 

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
db = SQLAlchemy(app)

class Contacts_log(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    phone_no = db.Column(db.String, nullable=False)
    msg = db.Column(db.String, nullable=False)
    date = db.Column(db.String, nullable=True)
    email = db.Column(db.String, nullable=False)
class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, nullable=False)
    content = db.Column(db.String, nullable=False)
    slug = db.Column(db.String, nullable=False)
    date = db.Column(db.String, nullable=True)
    img_file = db.Column(db.String, nullable=True)
    tagline = db.Column(db.String, nullable=True)

@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(params['no_of_posts_to_display_on_home_at_once']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page=int(page)

    posts = posts[(page-1)*int(params['no_of_posts_to_display_on_home_at_once']) : (page-1)*int(params['no_of_posts_to_display_on_home_at_once']) + int(params['no_of_posts_to_display_on_home_at_once'])]
    if page ==1:
        prev_backgroun = 'disabled'
        next_backgroun = ''
        prev = "#"
        next = "/?page="+str(page+1)
    elif page==last:
        prev_backgroun = ''
        next_backgroun = 'disabled'
        prev = "/?page="+str(page-1)
        next = "#"
    else:
        prev_backgroun = ''
        next_backgroun = ''
        prev = "/?page="+str(page-1)
        next = "/?page="+str(page+1)

    return render_template('index.html',params=params,posts=posts,prev = prev,next = next,prev_background=prev_backgroun,next_background=next_backgroun)


@app.route("/about")
def about():
    return render_template('about.html',params=params)

@app.route("/post/<string:post_slug>",methods = ['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug = post_slug).first()
    return render_template('post.html',params=params,post=post)

@app.route("/dashboard", methods=("GET", "POST"))
def dashboard():
    print(request.method)

    if request.method == "GET":
        if "user" in session and session["user"] == params["admin_user"]:
            posts = Posts.query.all()
            return render_template("dashboard.html", params=params, posts=posts)

    if request.method == "POST":
        username = request.form.get("uname")
        userpass = request.form.get("pass")
        if username == params["admin_user"] and userpass == params["admin_password"]:
            # set the session variable
            session["user"] = username
            posts = Posts.query.all()
            return render_template("dashboard.html", params=params, posts=posts)

    return render_template("login.html", params=params)

# @app.route('/dashboard')
# def dashboard():
#     posts = Posts.query.all()
#     return render_template('dashboard.html',params=params,posts=posts)

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts_log(name=name, phone_no = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
    return render_template('contact.html',params=params)

@app.route("/edit/<string:sno>", methods = ['GET', 'POST'])
def edit(sno):
    if "user" in session and session["user"] == params["admin_user"]:
        if request.method == 'POST':
            title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()
            if sno=='0':
                post = Posts(title=title, slug=slug, content=content, tagline=tline, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
                return redirect('/dashboard')
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = title
                post.slug = slug
                post.content = content
                post.tagline = tline
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/dashboard')
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',params=params,post = post,sno=sno)
    else:
        return render_template("login.html", params=params)

@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if "user" in session and session["user"] == params["admin_user"]:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            return 'Uploaded SuccessFully'
    else:
        return render_template("login.html", params=params)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/')

@app.route("/delete/<string:sno>")
def delete(sno):
    if "user" in session and session["user"] == params["admin_user"]:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')
    else:
        return render_template("login.html", params=params)   
app.run(debug=True)