import React from "react";
import auth from '../util/auth'

export async function getServerSideProps(ctx) {
  const {req, res} = ctx

  await auth(req, res)

  return {
    props: {}
  }
}

const Home = () => (
  <div>
    <div className="hero">
      <h1 className="title">Welcome!</h1>
      <div className="row">
        <p>
          Some text :D
        </p>
      </div>
    </div>

    <style jsx>{`
      .hero {
        width: 100%;
        color: #333;
      }
      .title {
        margin: 0;
        width: 100%;
        padding-top: 80px;
        line-height: 1.15;
        font-size: 48px;
      }
      .title,
      .description {
        text-align: center;
      }
      .row {
        max-width: 880px;
        margin: 80px auto 40px;
        display: flex;
        flex-direction: row;
        justify-content: space-around;
      }
    `}</style>
  </div>
);

export default Home;