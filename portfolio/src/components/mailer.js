app.post('/process', function(req, res){
    const mailer = require('nodemailer');
    const smtp = require('nodemailer-smtp-transport');

    async function mailjet(){
        const transport = mailer.createTransport(
            smtp({
                host: 'in.mailjet.com',
                port: 2525,
                auth: {
                    user: process.env.MAILJET_API_KEY || '',
                    pass: process.env.MAILJET_API_SECRET || '',
                },
            })
        );
        const json = await transport.sendMail({
            from: 'marlonburogportfolio@gmail.com',
            to: 'marlonburogportfolio@gmail.com',
            subject: req.body.email,
            text: req.body.ques,
        });
    console.log(json);
    }
    res.redirect(303, '/thankyou.html');
    mailjet();
})