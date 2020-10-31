import subprocess

def application(environ, start_response):
    status = '200 OK'

    output = subprocess.check_output(['ls', '-laFh', '/var/svn'])

    response_headers = [('Content-Type', 'text/plain'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)

    return [output]

