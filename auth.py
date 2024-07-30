import functools

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

from projetF.db import get_db

bp = Blueprint('auth', __name__, url_prefix='/auth')


@bp.route('/sign', methods=('GET', 'POST'))
def register():
    if request.method == 'POST':
        nom = request.form['nom']
        prenom = request.form['prenom']
        cin = request.form['cin']
        email = request.form['email']
        classes = request.form['classes']
        fields= request.form['fields']
        password  = request.form['password']

        db = get_db()
        error = None

        if not nom:
            error = ' Last Name is required.'
        elif not prenom:
            error = 'First Name is required.'
        elif not cin:
            error = ' cin is required.'
        elif not email :
            error = 'email is required.'
        elif not classes:
            error = 'class is required.'
        elif not fields:
            error = 'fields is required.'
        else :
            error ='password is required.'

        if error is None:
            try:
                db.execute(
                    "INSERT INTO etudiant (nom , prenom , cin , email , classes ,fields , password )  VALUES (?, ?)",
                    (nom,prenom,cin , email ,classes , fields , generate_password_hash(password)),
                )
                db.commit()
            except db.IntegrityError:
                error = f"User: {prenom}{nom} is already registered."
            else:
                return redirect(url_for("auth.login"))

        flash(error)

    return render_template('auth/sign.html') 


@bp.route('/login', methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        db = get_db()
        error = None
        user = db.execute(
            'SELECT * FROM etudiant WHERE email = ?', (email,)
        ).fetchone()

        if email is None:
            error = 'Incorrect username.'
        elif not check_password_hash(user['password'], password):
            error = 'Incorrect password.'

        if error is None:
            session.clear()
            session['user_id'] = user['id']
            return redirect(url_for('index'))

        flash(error)

    return render_template('auth/login.html')

@bp.before_app_request
def load_logged_in_user():
    user_id = session.get('etudiant_id')

    if user_id is None:
        g.user = None
    else:
        g.user = get_db().execute(
            'SELECT * FROM etudiant WHERE id = ?', (user_id,)
        ).fetchone()

@bp.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))