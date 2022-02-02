import './public/main.css';
import Navigation from './components/navbar.js';

function Main(){
    return(
        <div className="portfolio">
            <head>
                <title>Marlon Burog's Portfolio</title>
                <link rel="icon" href="/favicon.ico"></link> 
            </head>
            <div>
                <Navigation />
            </div>
            <div>
                <h1>Marlon Burog</h1>
                <h3>Filipino Billionaire Philanthropist</h3>
            </div>
        </div>
    );
}

export default Main;