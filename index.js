import express from 'express';

const app =express();
const port = process.env.port //3000;

app.get('/',(req,res)=> {
    res.json({
        message: 'Hello from container!',
       service: 'hello-node',
       pod: process.env.POD-NAME //'unknown',
       // time: new Date().toISOString(),
     });
});

app.get('/ready',(req,res) => res.status(200).send('ready') );
app.get('/health',(req,res) => res.status(200).send('OK') );
app.listen(port, ()=> {
    console.log(`Example app  listening on port ${port}!`);
});