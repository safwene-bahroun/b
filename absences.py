from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort
from datetime import datetime
from projetF.auth import login_required
from projetF.db import get_db

bp = Blueprint('absences', __name__)


@bp.route('/')
@login_required
def absences ():
    db = get_db()
    if request.method == 'POST':
        calsses= request.form['classes']
        password = request.form['password']
        posts = db.execute(
        'SELECT etudiant.cin absences.date_absence '
        ' FROM absences  JOIN etudiant u ON abcences.etudiant_id = u.id'
        ' ORDER BY created DESC'
    ).fetchall()

    return render_template('absences/your_absences.html',posts =posts)




