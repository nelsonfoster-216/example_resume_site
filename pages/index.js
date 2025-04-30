import React from 'react'
import Head from 'next/head'

export default function Home() {
  return (
    <>
      <Head>
        <title>Sophia Reynolds - UX Designer Portfolio</title>
        <meta name="description" content="UX Designer portfolio showcasing professional work and experience" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>
      <div style={{ padding: '50px', fontFamily: 'Arial, sans-serif', maxWidth: '800px', margin: '0 auto' }}>
        <h1 style={{ color: '#DD4803' }}>Sophia Reynolds - UX Designer Portfolio</h1>
        <p>Welcome to my portfolio site! This is a fallback page - the main site is still being configured.</p>
        
        <div style={{ padding: '20px', backgroundColor: '#f5f5f5', borderRadius: '10px', marginTop: '20px' }}>
          <h2>Portfolio Highlights</h2>
          <ul style={{ lineHeight: '1.6' }}>
            <li>UX Designer with 5+ years of experience</li>
            <li>Specialized in user research and interface design</li>
            <li>Portfolio of work for major tech companies</li>
          </ul>
        </div>
        
        <p style={{ marginTop: '40px', color: '#666' }}>Thank you for visiting! The complete portfolio is coming soon.</p>
      </div>
    </>
  )
} 