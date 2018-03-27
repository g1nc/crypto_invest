import React from 'react'

const Register = () =>
  <div className="wrapper-page">
    <div className="card">
      <div className="card-block">
        <h3 className="text-center mt-0 m-b-15">
          <a href="/" className="logo logo-admin">Crypto Invest</a>
        </h3>
        <h4 className="text-muted text-center font-18">
          <b>Register</b>
        </h4>
        <div className="p-3">
          <form action="/" className="form-horizontal m-t-20">
            <div className="form-group row">
              <div className="col-12">
                <input type="email" className="form-control" required placeholder="Email" />
              </div>
            </div>
            <div className="form-group row">
              <div className="col-12">
                <input type="text" className="form-control" required placeholder="Username" />
              </div>
            </div>
            <div className="form-group row">
              <div className="col-12">
                <input type="password" className="form-control" required placeholder="Password" />
              </div>
            </div>
            <div className="form-group text-center row m-t-20">
              <div className="col-12">
                <button className="btn btn-primary btn-block waves-effect waves-light" type="submit">Register</button>
              </div>
            </div>
            <div className="form-group m-t-10 mb-0 row">
              <div className="col-12 m-t-20 text-center">
                <a href="/login" className="text-muted">Already have account?</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

export default Register