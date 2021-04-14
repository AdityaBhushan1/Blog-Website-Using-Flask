from flask import Flask, render_template, request
from flask import session
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json

with open("config.json", "r") as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = "Your-Secret-Key"
app.config[
    "SQLALCHEMY_DATABASE_URI"
] = "postgresql://postgres:postgres@localhost:5432/postgres"  # example uri'postgresql://<usernameofdb>:<passwordofdb>@localhost/<dbname>'

app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
db = SQLAlchemy(app)


class Contacts_log(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_no = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, nullable=False)
    content = db.Column(db.String, nullable=False)
    slug = db.Column(db.String, nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String, nullable=True)
    tagline = db.Column(db.String, nullable=True)


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()[0 : params["no_of_pages"]]
    return render_template("index.html", params=params, posts=posts)


@app.route("/about")
def about():
    return render_template("about.html", params=params)


@app.route("/post/<string:post_slug>", methods=["GET"])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template("post.html", params=params, post=post)


@app.route("/dashboard", methods=("GET", "POST"))
def dashboard():
    session.clear()

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
            # posts = Posts.query.all()
            posts = []
            return render_template("dashboard.html", params=params, posts=posts)

    return render_template("login.html", params=params)


@app.route("/contact", methods=["GET", "POST"])
def contact():
    if request.method == "POST":
        """Add entry to the database"""
        name = request.form.get("name")
        email = request.form.get("email")
        phone = request.form.get("phone")
        message = request.form.get("message")
        entry = Contacts_log(name=name, phone_no=phone, msg=message, date=datetime.now(), email=email)
        db.session.add(entry)
        db.session.commit()
    return render_template("contact.html", params=params)


app.run("192.168.1.101", debug=True)
