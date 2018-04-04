DROP DATABASE IF EXISTS tyrodev;
CREATE DATABASE tyrodev;

\c tyrodev;


DROP TABLE IF EXISTS users, tickets, files, problems, problem, solutions, comments, tickets, solution;

CREATE TABLE users (
    ID SERIAL PRIMARY KEY,
    fullName VARCHAR,
    username VARCHAR UNIQUE,
    password_digest VARCHAR,
    email VARCHAR,
    profile_Pic VARCHAR DEFAULT 'https://image.flaticon.com/icons/svg/16/16480.svg',
    stack VARCHAR,
    links VARCHAR
);

CREATE TABLE tickets (
    ID SERIAL PRIMARY KEY,
    ticket_userID INTEGER REFERENCES users(ID),
    ticketDate VARCHAR,
    problemStatus BIT,
    title VARCHAR
);

CREATE TABLE files (
    ID SERIAL PRIMARY KEY,
    code VARCHAR,
    fileName VARCHAR,
    ticketID INTEGER REFERENCES tickets(ID),
    language VARCHAR,
    file_userID INTEGER REFERENCES users(ID)
);

CREATE TABLE problems (
    ID SERIAL PRIMARY KEY,
    ticketID INTEGER REFERENCES tickets(ID),
    problem_description VARCHAR,
    lines VARCHAR DEFAULT NULL
);


CREATE TABLE solutions (
    ID SERIAL PRIMARY KEY,
    ticketID INTEGER REFERENCES tickets(ID),
    solution_userID INTEGER REFERENCES users(ID),
    solution_description VARCHAR,
    postDate VARCHAR
);

CREATE TABLE comments (
    ID SERIAL PRIMARY KEY,
    ticketID INTEGER REFERENCES tickets(ID),
    commenter_id INTEGER REFERENCES users(ID),
    comment VARCHAR,
    commentDate VARCHAR
);





INSERT INTO users (username, fullName, password_digest, email, profile_pic, stack, links)
  VALUES('MoMo','Monique Mojica', '$2a$10$noryJFgByFccCS/F6XILSeqM.3TqBhmRJ0QtAMPHtlzriqk6rsY8S', 'momo@tyrodev.com', 'https://media.licdn.com/dms/image/C5603AQH4BiE3sUUIWQ/profile-displayphoto-shrink_800_800/0?e=1527746400&v=alpha&t=T_1KJr52ctP68HOtsmfnTMkfsVcLWXoInOGkTp3SzSQ', 'HTML, Python', 'https://github.com/mon33k, https://www.linkedin.com/in/moniquemojica/'),
         ('Si-Mon', 'Simon Gaviria', '$2a$10$noryJFgByFccCS/F6XILSeqM.3TqBhmRJ0QtAMPHtlzriqk6rsY8S', 'si-mon@tyrodev.com', 'https://media.licdn.com/dms/image/C4E00AQFMBuHG5_gS8w/profile-displayphoto-shrink_800_800/0?e=1522648800&v=alpha&t=mU5_5Bo9Lb8LBy5OxCmV-XCKThg2Nc08zVaA_-GDdy4', 'Basic, Assembly, ASCII', 'https://github.com/simongaviria1, https://www.linkedin.com/in/simon-gaviria/'),
         ('Newton21', 'Newton Brooks', '$2a$10$noryJFgByFccCS/F6XILSeqM.3TqBhmRJ0QtAMPHtlzriqk6rsY8S', 'newton21@tyrodev.com','https://media.licdn.com/dms/image/C4E03AQFb_xBYxIBS3Q/profile-displayphoto-shrink_200_200/0?e=1527746400&v=alpha&t=c2C4u-ogTjALQ_5Ad7Uyjb40OW1Wsqw1s8RNkcJZua4', 'JS, React, Pug, HTML, CSS', 'https://github.com/newton-brooks, https://www.linkedin.com/in/newtonbrooks/'),
         ('Edje-C', 'Elon Jefferson','$2a$10$noryJFgByFccCS/F6XILSeqM.3TqBhmRJ0QtAMPHtlzriqk6rsY8S', 'edje-c@tyrodev.com', 'https://media.licdn.com/dms/image/C5603AQEYfXhxT_WETA/profile-displayphoto-shrink_800_800/0?e=1527746400&v=alpha&t=sdz-WQUsI62007v4nAFwMdNm_bl6jrUEitIVaE1E5PI', 'Python, C++, Machine Learning', 'https://github.com/Edje-C, https://www.linkedin.com/in/elonjefferson/'),
         ('C-Low', 'Carlo Valenti','$2a$10$noryJFgByFccCS/F6XILSeqM.3TqBhmRJ0QtAMPHtlzriqk6rsY8S', 'c-low@tyrodev.com', 'https://image.flaticon.com/icons/svg/16/16480.svg', 'Python, C++, Machine Learning', 'https://github.com/cval-c4q, https://www.linkedin.com/in/carlo-valenti-79b892153/');


INSERT INTO tickets (ticket_userID, ticketDate, problemStatus, title)
    VALUES (3, '3/17/18', '1', 'I really cant figure out this Concentration game.'),
           (1, '3/20/18', '1', 'None of my routes are rendering, and I really feel like Im doing everything right.'),
           (4, '3/20/18', '1', 'This h3 tag wont wrap.'),
           (2, '3/21/18', '0', 'Im new to React Native and I dont know to since the native parts of this code.'),
           (1, '3/22/18', '0', 'Can someone explain how recursion works?'),
           (2, '3/25/18', '1', 'I dont know the proper way to grab data from this matrix.'),
           (3, '3/26/18', '1', 'Binding DX'),
           (5, '3/29/18', '0', 'Does anyone know how to unsync servers?');

INSERT INTO files (ticketID, file_userID, fileName, language, code)
    VALUES (1, 3, 'app.js', 'JavaScript', 'Y29uc3QgUmVhY3QgPSByZXF1aXJlKCdyZWFjdCcpCmNvbnN0IFJlYWN0RE9NID0gcmVxdWlyZSgncmVhY3QtZG9tJykKCmNvbnN0IGNhcmRzID0gWwogICJhcHBsZSIsCiAgImNhbWVyYSIsCiAgImNsb3ZlciIsCiAgImNvZmZlZSIsCiAgImhlYXJ0IiwKICAia2V5IiwKICAicGF3IiwKICAic21pbGV5IiwKICAic25vd2ZsYWtlIiwKICAic3RhciJdCgpjbGFzcyBBcHAgZXh0ZW5kcyBSZWFjdC5Db21wb25lbnQgewogIGNvbnN0cnVjdG9yKCkgewogICAgc3VwZXIoKTsKICAgIHRoaXMuZmxpcHBlZCA9IGZhbHNlCiAgICB0aGlzLnN0YXRlID0gewogICAgICBpbWcxOiAiIiwKICAgICAgaW1nMU5hbWU6ICIiLAogICAgICBjdXJyZW50Q2FyZDogIiIsCiAgICAgIGNhcmRJbWc6ICIiCiAgICB9CiAgfQoKICBkb3VibGVjYXJkcyA9ICgpID0+IHsKICAgIGNvbnN0IG5ld0FyciA9IFtdCiAgICBjYXJkcy5mb3JFYWNoKHYgPT4gewogICAgICBuZXdBcnIucHVzaCh2KzEsIHYrMikKICAgIH0pCiAgICByZXR1cm4gbmV3QXJyCiAgfQoKICBzaHVmZmxlQ2FyZHMgPSAoKSA9PiB7CiAgICBjb25zdCBhID0gdGhpcy5kb3VibGVjYXJkcygpCgogICAgZm9yIChsZXQgaSA9IGEubGVuZ3RoIC0gMTsgaSA+IDA7IGktLSkgewogICAgICBjb25zdCBqID0gTWF0aC5mbG9vcihNYXRoLnJhbmRvbSgpICogKGkgKyAxKSk7CiAgICAgIFthW2ldLCBhW2pdXSA9IFthW2pdLCBhW2ldXTsKICAgIH0KICAgIHJldHVybiBhOwogIH0KCiAgbWFrZUNhcmRzSW1ncyA9ICgpID0+IHsKICAgIHJldHVybiB0aGlzLnNodWZmbGVDYXJkcygpLm1hcChpbWcgPT4gewogICAgICBjb25zdCBiYWNrQ2FyZCA9ICdodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vQzRRL0FDXzRfV2ViL21hc3Rlci91bml0cy9yZWFjdC9leGVyY2lzZXMvb2JqZWN0c19hbmRfYXJyYXlzL2NhcmRzL2JhY2sucG5nJwogICAgICByZXR1cm4gPGltZyBhbHQ9e2ltZ30gb25DbGljaz17dGhpcy5jbGlja0hhbmRsZXJ9IHNyYz17YmFja0NhcmR9IC8+CiAgICB9KQogIH0KICBjb21wb25lbnREaWRNb3VudCA9ICgpID0+IHsKICAgIGNvbnN0IGFyciA9IHRoaXMubWFrZUNhcmRzSW1ncygpCiAgICB0aGlzLnNldFN0YXRlKHsgY2FyZEltZ3M6IGFyciB9KQogIH0KCgogIGNsaWNrSGFuZGxlciA9IChlKSA9PiB7CiAgICBjb25zdCBuYW1lID0gZS50YXJnZXQuYWx0CiAgICBjb25zdCBpbWcxID0gdGhpcy5zdGF0ZS5pbWcxCiAgICBjb25zdCBpbWcxTmFtZSA9IHRoaXMuc3RhdGUuaW1nMU5hbWUKICAgIGNvbnN0IGJhY2sgPSAiaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0M0US9BQ180X1dlYi9tYXN0ZXIvdW5pdHMvcmVhY3QvZXhlcmNpc2VzL29iamVjdHNfYW5kX2FycmF5cy9jYXJkcy9iYWNrLnBuZyIKICAgIGlmICh0aGlzLmZsaXBwZWQpIHsKICAgICAgcmV0dXJuCiAgICB9CgogICAgdGhpcy5zZXRTdGF0ZSh7IGN1cnJlbnRDYXJkOiBlLnRhcmdldCB9KQogICAgaWYgKCFpbWcxKSB7CiAgICAgIHRoaXMuc2V0U3RhdGUoeyBpbWcxTmFtZTogbmFtZSwgaW1nMTogZS50YXJnZXQgfSkKICAgICAgY29uc29sZS5sb2coZS50YXJnZXQpCgogICAgfSBlbHNlIHsKICAgICAgaWYobmFtZSA9PT0gaW1nMU5hbWUpewogICAgICAgIHJldHVybgogICAgICB9CiAgICAgIHRoaXMuZmxpcHBlZCA9IHRydWUKICAgICAgaWYgKGltZzFOYW1lLnNsaWNlKDAsIC0xKSA9PT0gbmFtZS5zbGljZSgwLCAtMSkgJiYgaW1nMU5hbWUgIT09IG5hbWUpIHsKICAgICAgICB0aGlzLnNldFN0YXRlKHsgaW1nMTogIiIsIGltZzFOYW1lOiAiIiwgY3VycmVudENhcmQ6ICIiIH0pCiAgICAgICAgdGhpcy5mbGlwcGVkID0gZmFsc2UKICAgICAgfSBlbHNlIHsKICAgICAgICBzZXRUaW1lb3V0KChlKSA9PiB7CiAgICAgICAgICB0aGlzLnN0YXRlLmltZzEuc3JjID0gYmFjazsKICAgICAgICAgIHRoaXMuc3RhdGUuY3VycmVudENhcmQuc3JjID0gYmFjazsKICAgICAgICAgIHRoaXMuc2V0U3RhdGUoeyBpbWcxOiAiIiwgaW1nMU5hbWU6ICIiLCBjdXJyZW50Q2FyZDogIiIgfSk7CiAgICAgICAgICAvL2dpdmVzIHRoZSBva2F5IHRvIGZsaXAgYSBuZXcgY2FyZAogICAgICAgICAgdGhpcy5mbGlwcGVkID0gZmFsc2UKICAgICAgICB9LCA1MDApCiAgICAgIH0gCiAgICB9CgogICAgCiAgICBlLnRhcmdldC5zcmMgPSAnaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0M0US9BQ180X1dlYi9tYXN0ZXIvdW5pdHMvcmVhY3QvZXhlcmNpc2VzL29iamVjdHNfYW5kX2FycmF5cy9jYXJkcy8nICsgbmFtZS5zbGljZSgwLCAtMSkgKyAnLnBuZycKICB9CgoKICByZW5kZXIgPSAoKSA9PiB7CiAgICByZXR1cm4gKAogICAgICA8ZGl2PgogICAgICAgIDxkaXYgY2xhc3NOYW1lPSJpbWctY29udGFpbmVyIj4KICAgICAgICAgIHt0aGlzLnN0YXRlLmNhcmRJbWdzfQogICAgICAgIDwvZGl2PgogICAgICA8L2Rpdj4KICAgICkKICB9Cn0KClJlYWN0RE9NLnJlbmRlcig8QXBwIC8+LCBkb2N1bWVudC5nZXRFbGVtZW50QnlJZCgncm9vdCcpKTsK'),
           (2, 1, 'teachers.sql', 'SQL', 'RFJPUCBEQVRBQkFTRSBJRiBFWElTVFMgdGVhY2hlcnNhbmRzY2hvb2xzOwpDUkVBVEUgREFUQUJBU0UgdGVhY2hlcnNhbmRzY2hvb2xzOwoKYyB0ZWFjaGVyc2FuZHNjaG9vbHM7CgpDUkVBVEUgVEFCTEUgc2Nob29scyAoCiAgSUQgU0VSSUFMIFBSSU1BUlkgS0VZLAogIG5hbWUgVkFSQ0hBUiBOT1QgTlVMTAopOwoKQ1JFQVRFIFRBQkxFIHRlYWNoZXJzICgKICBJRCBTRVJJQUwgUFJJTUFSWSBLRVksCiAgbmFtZSBWQVJDSEFSIE5PVCBOVUxMLAogIHN1YmplY3QgVkFSQ0hBUiwKICBzY2hvb2xJRCBJTlRFR0VSIFJFRkVSRU5DRVMgc2Nob29scwopOwoKSU5TRVJUIElOVE8gc2Nob29scyAoSUQsIG5hbWUpCiAgVkFMVUVTICgxLCAnRWFzdCBIaWdoIFNjaG9vbCcpLAogICgyLCAnV2VzdCBIaWdoIFNjaG9vbCcpLAogICgzLCAnQ2VudHJhbCBIaWdoIFNjaG9vbCcpOwoKSU5TRVJUIElOVE8gdGVhY2hlcnMgKElELCBuYW1lLCBzdWJqZWN0LCBzY2hvb2xJRCkKICBWQUxVRVMgKDEsICdIZXJtYW4gTWlsbGVyJywgJ0Jpb2xvZ3knLCAyKSwKICAoMiwgJ0ZyYW5rIEdlaHJ5JywgJ0VuZ2xpc2gnLCAxKSwKICAoMywgJ0FpIFdlaXdlaScsICdIaXN0b3J5JywgMiksCiAgKDQsICdDaW5keSBTaGVybWFuJywgJ01hdGgnLCAzKSwKICAoNSwgJ1lheW9pIEt1c2FtYScsICdHeW0nLCAxKSwKICAoNiwgJ01hcmluYSBBYnJhbW92aWMnLCAnSGlzdG9yeScsIDEpLAogICg3LCAnUmljaGFyZCBTZXJyYScsICdBcnQnLCAzKSwKICAoOCwgJ0xvdWlzZSBCb3VyZ2VvaXMnLCAnRW5nbGlzaCcsIDIpLAogICg5LCAnS2FyYSBXYWxrZXInLCAnQ2hlbWlzdHJ5JywgMyksCiAgKDEwLCAnQW5pc2ggS2Fwb29yJywgJ1BoeXNpY3MnLCAxKSwKICAoMTEsICdZb2tvIE9ubycsICdNdXNpYycsIDIpLAogICgxMiwgJ0FnbmVzIE1hcnRpbicsICdNYXRoJywgMyksCiAgKDEzLCAnSGVsaW8gT3RpY2ljYScsICdHeW0nLCAyKSwKICAoMTQsICdDYXJsIFBvcGUnLCAnQmlvbG9neScsIDEpLAogICgxNSwgJ0RhdmlkIEhvY2tuZXknLCAnR3ltJywgMyksCiAgKDE2LCAnV2lsbGlhbSBMZWF2aXR0JywgJ01hdGgnLCAyKSwKICAoMTcsICdFZHVhcmRvIEthYycsICdFbmdsaXNoJywgMyksCiAgKDE4LCAnU3RldmUgTWNRdWVlbicsICdIaXN0b3J5JywgMyksCiAgKDE5LCAnVGFrYXNoaSBNdXJha2FtaScsICdQaHlzaWNzJywgMiksCiAgKDIwLCAnTmFtIEp1bmUgUGFpaycsICdNdXNpYycsIDEpLAogICgyMSwgJ0dlcmhhcmQgUmljaHRlcicsICdBcnQnLCBOVUxMKSwKICAoMjIsICdBbmR5IFdhcmhvbCcsICdDaGVtaXN0cnknLCBOVUxMKSwKICAoMjMsICdKZW5ueSBIb2x0emVyJywgJ01hdGgnLCBOVUxMKTsK'),
           (2, 1, 'router.js', 'JavaScript', 'aW1wb3J0IFJlYWN0LCB7IENvbXBvbmVudCB9IGZyb20gJ3JlYWN0JzsKaW1wb3J0IHtSb3V0ZSwgU3dpdGNoLCBMaW5rfSBmcm9tICdyZWFjdC1yb3V0ZXItZG9tJzsKaW1wb3J0IGF4aW9zIGZyb20gJ2F4aW9zJzsKaW1wb3J0IFNjaG9vbHMgZnJvbSAnLi9zY2hvb2xzJwppbXBvcnQgU3ViamVjdCBmcm9tICcuL3N1YmplY3QnCmltcG9ydCBTZWFyY2ggZnJvbSAnLi9zZWFyY2gnCgpjbGFzcyBUZWFjaGVycyBleHRlbmRzIENvbXBvbmVudCB7CiAgY29uc3RydWN0b3IoKXsKICAgIHN1cGVyKCk7CiAgICB0aGlzLnN0YXRlID0gewogICAgICB0ZWFjaGVyczogW10KICAgIH0KICB9CgogIGNvbXBvbmVudERpZE1vdW50KCl7CiAgICBheGlvcwogICAgICAuZ2V0KCcvdXNlcnMvdGVhY2hlcnMvYWxsJykKICAgICAgLnRoZW4ocmVzID0+IHsKICAgICAgICB0aGlzLnNldFN0YXRlKHt0ZWFjaGVyczogcmVzLmRhdGEuZGF0YX0pCiAgICAgIH0pCiAgfQoKICByZW5kZXJUZWFjaGVycyA9ICgpID0+IDx1bD57dGhpcy5zdGF0ZS50ZWFjaGVycy5tYXAodiA9PiA8bGk+e3YubmFtZX0gOiB7di5zY2hvb2w/IHYuc2Nob29sIDogJ251bGwnfSA6IHt2LnN1YmplY3R9PC9saT4pfTwvdWw+CgogIHJlbmRlcigpIHsKICAgIHJldHVybiAoCiAgICAgIDxkaXY+CiAgICAgICAgPFN3aXRjaD4KICAgICAgICAgIDxSb3V0ZSBleGFjdCBwYXRoPSIvdGVhY2hlcnMiIHJlbmRlcj17dGhpcy5yZW5kZXJUZWFjaGVyc30vPgogICAgICAgICAgPFJvdXRlIGV4YWN0IHBhdGg9Ii90ZWFjaGVycy9zY2hvb2xzIiBjb21wb25lbnQ9e1NjaG9vbHN9Lz4KICAgICAgICAgIDxSb3V0ZSBleGFjdCBwYXRoPSIvdGVhY2hlcnMvc3ViamVjdHMiIGNvbXBvbmVudD17U3ViamVjdH0vPgogICAgICAgICAgPFJvdXRlIGV4YWN0IHBhdGg9Ii90ZWFjaGVycy9zZWFyY2giIGNvbXBvbmVudD17U2VhcmNofS8+CiAgICAgICAgPC9Td2l0Y2g+CiAgICAgIDwvZGl2PgogICAgKTsKICB9Cn0KCmV4cG9ydCBkZWZhdWx0IFRlYWNoZXJzOwo='),
           (3, 4, 'blog.html', 'HTML', 'PCFET0NUWVBFIGh0bWw+CjxodG1sIGxhbmc9ImVuIj4KPGhlYWQ+Cgk8bGluayByZWw9InN0eWxlc2hlZXQiIHR5cGU9InRleHQvY3NzIiBocmVmPSJibG9nLmNzcyI+Cgk8bGluayBocmVmPSJodHRwczovL2ZvbnRzLmdvb2dsZWFwaXMuY29tL2Nzcz9mYW1pbHk9S2FtZXJvbiIgcmVsPSJzdHlsZXNoZWV0Ij4KCgk8bWV0YSBjaGFyc2V0PSJVVEYtOCI+Cgk8dGl0bGU+QmxvZzwvdGl0bGU+CjwvaGVhZD4KPGJvZHk+Cgk8aDE+IC0gQmxvZyAtIDwvaDE+Cgk8ZGl2IGNsYXNzPSJwYWdlIj4KCQk8aDI+VGhpcyBoYXBwZW5lZCB0b2RheS48L2gyPgoJCTxwIGNsYXNzPSJwb3N0Ij5Td2FnIHZpbnlsIGNsaWNoZSB2YXBlIGlyb255LCBwb2tlIHF1aW5vYSB1bWFtaSBwdWcuIFZpY2Uga29tYnVjaGEgbGlzdGljbGUgYmFuaCBtaSBoYW1tb2NrIDkwJ3MgYnV0Y2hlciwgZ2x1dGVuLWZyZWUgZHJlYW1jYXRjaGVyLiBNaWNyb2Rvc2luZyBtZXNzZW5nZXIgYmFnIG1laCBwb2sgcG9rLCBraW5mb2xrIHBpbnRlcmVzdCB0b2Z1LiBUcnktaGFyZCBuZXh0IGxldmVsIGNvcm5ob2xlIHNoYWJieSBjaGljIGNyZWQsIGJlZm9yZSB0aGV5IHNvbGQgb3V0IGFydGlzYW4gY2hhcnRyZXVzZSBxdWlub2EgZmFwLiBTcXVpZCB0aWxkZSBzdWJ3YXkgdGlsZSBjcm9udXQgZ29kYXJkLCB2aW55bCBwYWxlbyBjb2xvcmluZyBib29rIGxpc3RpY2xlLiBWaWNlIGtvbWJ1Y2hhIHBsYWlkIGNvbG9yaW5nIGJvb2sga2V5dGFyLCBldHN5IG1pY3JvZG9zaW5nLiBUb2Z1IGxpdGVyYWxseSB0aHVuZGVyY2F0cywgYWZmb2dhdG8gY29wcGVyIG11ZyBmb3JhZ2UgcmV0cm8gdGlsZGUgamlhbmJpbmcgd2Fpc3Rjb2F0LjwvcD4KCQk8cCBjbGFzcz0iZGF0ZSI+VG9kYXk8L3A+Cgk8L2Rpdj4KCTxocj4KCTxkaXYgY2xhc3M9InBhZ2UiPgoJCTxoMj5Qb3N0IGZyb20geWVzdGVyZGF5LjwvaDI+CgkJPHAgY2xhc3M9InBvc3QiPkZvdXIgbG9rbyBrb2dpIHdva2Ugc2NlbmVzdGVyLCB0cnVmZmF1dCB3b2xmIHRvdGUgYmFnIGRlZXAgdiB2aW55bCBtZWdnaW5ncyB2aWNlIGV0aGljYWwgbWVkaXRhdGlvbi4gU2NlbmVzdGVyIGNvcHBlciBtdWcgbWVzc2VuZ2VyIGJhZyBtZWggdGh1bmRlcmNhdHMsIGRlZXAgdiBlY2hvIHBhcmsgZ2FzdHJvcHViIGhhbW1vY2sgYnVzaHdpY2sgbXVtYmxlY29yZSBkcmlua2luZyB2aW5lZ2FyLiBCaW9kaWVzZWwgZmxleGl0YXJpYW4gaGFtbW9jayBmaXhpZS4gUG9rIHBvayBvcmdhbmljIHBpY2tsZWQgZmFubnkgcGFjayB2YXBlIGNyb251dCBmb3JhZ2UgdGh1bmRlcmNhdHMsIGplYW4gc2hvcnRzIGZhcm0tdG8tdGFibGUgc2VsdmFnZSBwb3JrIGJlbGx5IGRlZXAgdiBnYXN0cm9wdWIuIFBvcC11cCB0b3VzbGVkIGNydWNpZml4IHNjaGxpdHogYWlyIHBsYW50LCBkcmVhbWNhdGNoZXIgYmljeWNsZSByaWdodHMuIElyb255IGhvb2RpZSBnYXN0cm9wdWIgdmVubW8gc2NobGl0eiA4LWJpdCBicnVuY2guIEhleGFnb24gY3JlZCBtdXN0YWNoZSwgcmFtcHMgY29sb3JpbmcgYm9vayBjb2xkLXByZXNzZWQgZGlzcnVwdCBiZWZvcmUgdGhleSBzb2xkIG91dCBzdWJ3YXkgdGlsZSB0dW1lcmljIHJhY2xldHRlIGlyb255IFZIUyBzZWl0YW4ga2FsZSBjaGlwcy48L3A+CgkJPHAgY2xhc3M9ImRhdGUiPlllc3RlcmRheTwvcD4KCTwvZGl2Pgo8L2JvZHk+CjwvaHRtbD4='),
           (3, 4, 'style.css', 'CSS', 'Ym9keXsKCWJhY2tncm91bmQtY29sb3I6ICMyMjI7Cgljb2xvcjojZGRkOwoJZm9udC1mYW1pbHk6IEFkYW07CglsaW5lLWhlaWdodDogMS41Owp9CgpoMXsKCWJhY2tncm91bmQtY29sb3I6ICNkZGQ7Cglmb250LXNpemU6IDYwcHg7Cgljb2xvcjogIzIyMjsKCXRleHQtYWxpZ246IGNlbnRlcjsKCW1hcmdpbjogLThweDsKfQoKLnBhZ2V7CgltYXJnaW46IDUlIDIwJTsKfQoKaDJ7Cglmb250LXNpemU6IDQwcHg7Cgl0ZXh0LWFsaWduOiBjZW50ZXI7Cn0KCi5wb3N0ewoJY29sb3I6ICNiYmI7Cglmb250LXNpemU6IDIwcHg7CglwYWRkaW5nOiAwIDIlOwp9CgouZGF0ZXsKCW1hcmdpbi1sZWZ0OiA3MCU7Cglmb250LXNpemU6IDIwcHg7Cn0KCmhyewoJd2lkdGg6IDUwJTsKCWJvcmRlcjogMDsKICAgIGhlaWdodDogMnB4OwogICAgYmFja2dyb3VuZC1pbWFnZTogbGluZWFyLWdyYWRpZW50KHRvIHJpZ2h0LCByZ2JhKDI1NSwgMjU1LCAyNTUsIDApLCByZ2JhKDI1NSwgMjU1LCAyNTUsIDAuNzUpLCByZ2JhKDI1NSwgMjU1LCAyNTUsIDApKTsKfQ=='),
           (2, 2, 'router.js', 'JavaScript', 'aW1wb3J0IFJlYWN0LCB7IENvbXBvbmVudCB9IGZyb20gJ3JlYWN0JzsKaW1wb3J0IHtSb3V0ZSwgU3dpdGNoLCBMaW5rfSBmcm9tICdyZWFjdC1yb3V0ZXItZG9tJzsKaW1wb3J0IGF4aW9zIGZyb20gJ2F4aW9zJzsKaW1wb3J0IFNjaG9vbHMgZnJvbSAnLi9zY2hvb2xzJwppbXBvcnQgU3ViamVjdCBmcm9tICcuL3N1YmplY3QnCmltcG9ydCBTZWFyY2ggZnJvbSAnLi9zZWFyY2gnCgpjbGFzcyBUZWFjaGVycyBleHRlbmRzIENvbXBvbmVudCB7CiAgY29uc3RydWN0b3IoKXsKICAgIHN1cGVyKCk7CiAgICB0aGlzLnN0YXRlID0gewogICAgICB0ZWFjaGVyczogW10KICAgIH0KICB9CgogIGNvbXBvbmVudERpZE1vdW50KCl7CiAgICBheGlvcwogICAgICAuZ2V0KCcvdXNlcnMvdGVhY2hlcnMvYWxsJykKICAgICAgLnRoZW4ocmVzID0+IHsKICAgICAgICB0aGlzLnNldFN0YXRlKHt0ZWFjaGVyczogcmVzLmRhdGEuZGF0YX0pCiAgICAgIH0pCiAgfQoKICByZW5kZXJUZWFjaGVycyA9ICgpID0+IDx1bD57dGhpcy5zdGF0ZS50ZWFjaGVycy5tYXAodiA9PiA8bGk+e3YubmFtZX0gOiB7di5zY2hvb2w/IHYuc2Nob29sIDogJ251bGwnfSA6IHt2LnN1YmplY3R9PC9saT4pfTwvdWw+CgogIHJlbmRlcigpIHsKICAgIHJldHVybiAoCiAgICAgIDxkaXY+CiAgICAgICAgPFN3aXRjaD4KICAgICAgICAgIDxSb3V0ZSBleGFjdCBwYXRoPSIvdGVhY2hlcnMiIHJlbmRlcj17dGhpcy5yZW5kZXJUZWFjaGVyc30vPgogICAgICAgICAgPFJvdXRlIHBhdGg9Ii90ZWFjaGVycy9zY2hvb2xzIiBjb21wb25lbnQ9e1NjaG9vbHN9Lz4KICAgICAgICAgIDxSb3V0ZSBwYXRoPSIvdGVhY2hlcnMvc3ViamVjdHMiIGNvbXBvbmVudD17U3ViamVjdH0vPgogICAgICAgICAgPFJvdXRlIHBhdGg9Ii90ZWFjaGVycy9zZWFyY2giIGNvbXBvbmVudD17U2VhcmNofS8+CiAgICAgICAgPC9Td2l0Y2g+CiAgICAgIDwvZGl2PgogICAgKTsKICB9Cn0KCmV4cG9ydCBkZWZhdWx0IFRlYWNoZXJzOwo='),
           (4, 2, 'app.js', 'JavaScript', 'aW1wb3J0IFJlYWN0IGZyb20gJ3JlYWN0JzsKaW1wb3J0IFJlYWN0RE9NIGZyb20gJ3JlYWN0LWRvbSc7CmltcG9ydCB7QnJvd3NlclJvdXRlcn0gZnJvbSAncmVhY3Qtcm91dGVyLWRvbSc7CmltcG9ydCAnLi9pbmRleC5jc3MnOwppbXBvcnQgQXBwIGZyb20gJy4vQXBwJzsKaW1wb3J0IHJlZ2lzdGVyU2VydmljZVdvcmtlciBmcm9tICcuL3JlZ2lzdGVyU2VydmljZVdvcmtlcic7CgpSZWFjdERPTS5yZW5kZXIoCiAgICA8QnJvd3NlclJvdXRlcj4KICAgIDxBcHAvPgogICAgPC9Ccm93c2VyUm91dGVyPiwgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ3Jvb3QnKSk7CnJlZ2lzdGVyU2VydmljZVdvcmtlcigpOw=='),
           (4, 2, 'IOSComponents.swift', 'Swift', 'aW1wb3J0IFJlYWN0IGZyb20gJ3JlYWN0JzsKaW1wb3J0IFJlYWN0RE9NIGZyb20gJ3JlYWN0LWRvbSc7CmltcG9ydCB7QnJvd3NlclJvdXRlcn0gZnJvbSAncmVhY3Qtcm91dGVyLWRvbSc7CmltcG9ydCAnLi9pbmRleC5jc3MnOwppbXBvcnQgQXBwIGZyb20gJy4vQXBwJzsKaW1wb3J0IHJlZ2lzdGVyU2VydmljZVdvcmtlciBmcm9tICcuL3JlZ2lzdGVyU2VydmljZVdvcmtlcic7CgpSZWFjdERPTS5yZW5kZXIoCiAgICA8QnJvd3NlclJvdXRlcj4KICAgIDxBcHAvPgogICAgPC9Ccm93c2VyUm91dGVyPiwgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ3Jvb3QnKSk7CnJlZ2lzdGVyU2VydmljZVdvcmtlcigpOw=='),
           (4, 2, 'AndroidComponents.java', 'Java', 'aW1wb3J0IFJlYWN0IGZyb20gJ3JlYWN0JzsKaW1wb3J0IFJlYWN0RE9NIGZyb20gJ3JlYWN0LWRvbSc7CmltcG9ydCB7QnJvd3NlclJvdXRlcn0gZnJvbSAncmVhY3Qtcm91dGVyLWRvbSc7CmltcG9ydCAnLi9pbmRleC5jc3MnOwppbXBvcnQgQXBwIGZyb20gJy4vQXBwJzsKaW1wb3J0IHJlZ2lzdGVyU2VydmljZVdvcmtlciBmcm9tICcuL3JlZ2lzdGVyU2VydmljZVdvcmtlcic7CgpSZWFjdERPTS5yZW5kZXIoCiAgICA8QnJvd3NlclJvdXRlcj4KICAgIDxBcHAvPgogICAgPC9Ccm93c2VyUm91dGVyPiwgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ3Jvb3QnKSk7CnJlZ2lzdGVyU2VydmljZVdvcmtlcigpOw=='),
           (3, 2, 'style.css', 'CSS', 'Ym9keXsKCWJhY2tncm91bmQtY29sb3I6ICMyMjI7Cgljb2xvcjojZGRkOwoJZm9udC1mYW1pbHk6IEFkYW07CglsaW5lLWhlaWdodDogMS41Owp9CgpoMXsKCWJhY2tncm91bmQtY29sb3I6ICNkZGQ7Cglmb250LXNpemU6IDYwcHg7Cgljb2xvcjogIzIyMjsKCXRleHQtYWxpZ246IGNlbnRlcjsKCW1hcmdpbjogLThweDsKfQoKLnBhZ2V7CgltYXJnaW46IDUlIDIwJTsKfQoKaDJ7Cglmb250LXNpemU6IDQwcHg7Cgl0ZXh0LWFsaWduOiBjZW50ZXI7Cgl3b3JkLWJyZWFrOiBicmVhay13b3JkOwp9CgoucG9zdHsKCWNvbG9yOiAjYmJiOwoJZm9udC1zaXplOiAyMHB4OwoJcGFkZGluZzogMCAyJTsKfQoKLmRhdGV7CgltYXJnaW4tbGVmdDogNzAlOwoJZm9udC1zaXplOiAyMHB4Owp9CgpocnsKCXdpZHRoOiA1MCU7Cglib3JkZXI6IDA7CiAgICBoZWlnaHQ6IDJweDsKICAgIGJhY2tncm91bmQtaW1hZ2U6IGxpbmVhci1ncmFkaWVudCh0byByaWdodCwgcmdiYSgyNTUsIDI1NSwgMjU1LCAwKSwgcmdiYSgyNTUsIDI1NSwgMjU1LCAwLjc1KSwgcmdiYSgyNTUsIDI1NSwgMjU1LCAwKSk7Cn0='),
           (5, 1, 'recursion.py', 'Python', 'ZGVmIHBhc2NhbChuKToKICAgIGlmIG4gPT0gMToKICAgICAgICByZXR1cm4gWzFdCiAgICBlbHNlOgogICAgICAgIHBfbGluZSA9IHBhc2NhbChuLTEpCiAgICAgICAgbGluZSA9IFsgcF9saW5lW2ldK3BfbGluZVtpXSBmb3IgaSBpbiByYW5nZShsZW4ocF9saW5lKS0xKV0KICAgICAgICBsaW5lLmluc2VydCgwLDEpCiAgICAgICAgbGluZS5hcHBlbmQoMSkKICAgIHJldHVybiBsaW5l'),
           (1, 4, 'app.js', 'JavaScript', 'Y29uc3QgUmVhY3QgPSByZXF1aXJlKCdyZWFjdCcpCmNvbnN0IFJlYWN0RE9NID0gcmVxdWlyZSgncmVhY3QtZG9tJykKCmNvbnN0IGNhcmRzID0gWwogICJhcHBsZSIsCiAgImNhbWVyYSIsCiAgImNsb3ZlciIsCiAgImNvZmZlZSIsCiAgImhlYXJ0IiwKICAia2V5IiwKICAicGF3IiwKICAic21pbGV5IiwKICAic25vd2ZsYWtlIiwKICAic3RhciJdCgpjbGFzcyBBcHAgZXh0ZW5kcyBSZWFjdC5Db21wb25lbnQgewogIGNvbnN0cnVjdG9yKCkgewogICAgc3VwZXIoKTsKICAgIHRoaXMuZmxpcHBlZCA9IGZhbHNlCiAgICB0aGlzLnN0YXRlID0gewogICAgICBpbWcxOiAiIiwKICAgICAgaW1nMU5hbWU6ICIiLAogICAgICBjdXJyZW50Q2FyZDogIiIsCiAgICAgIGNhcmRJbWdzOiAiIgogICAgfQogIH0KCiAgZG91YmxlY2FyZHMgPSAoKSA9PiB7CiAgICBjb25zdCBuZXdBcnIgPSBbXQogICAgY2FyZHMuZm9yRWFjaCh2ID0+IHsKICAgICAgbmV3QXJyLnB1c2godisxLCB2KzIpCiAgICB9KQogICAgcmV0dXJuIG5ld0FycgogIH0KCiAgc2h1ZmZsZUNhcmRzID0gKCkgPT4gewogICAgY29uc3QgYSA9IHRoaXMuZG91YmxlY2FyZHMoKQoKICAgIGZvciAobGV0IGkgPSBhLmxlbmd0aCAtIDE7IGkgPiAwOyBpLS0pIHsKICAgICAgY29uc3QgaiA9IE1hdGguZmxvb3IoTWF0aC5yYW5kb20oKSAqIChpICsgMSkpOwogICAgICBbYVtpXSwgYVtqXV0gPSBbYVtqXSwgYVtpXV07CiAgICB9CiAgICByZXR1cm4gYTsKICB9CgogIG1ha2VDYXJkc0ltZ3MgPSAoKSA9PiB7CiAgICByZXR1cm4gdGhpcy5zaHVmZmxlQ2FyZHMoKS5tYXAoaW1nID0+IHsKICAgICAgY29uc3QgYmFja0NhcmQgPSAnaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0M0US9BQ180X1dlYi9tYXN0ZXIvdW5pdHMvcmVhY3QvZXhlcmNpc2VzL29iamVjdHNfYW5kX2FycmF5cy9jYXJkcy9iYWNrLnBuZycKICAgICAgcmV0dXJuIDxpbWcgYWx0PXtpbWd9IG9uQ2xpY2s9e3RoaXMuY2xpY2tIYW5kbGVyfSBzcmM9e2JhY2tDYXJkfSAvPgogICAgfSkKICB9CiAgY29tcG9uZW50RGlkTW91bnQgPSAoKSA9PiB7CiAgICBjb25zdCBhcnIgPSB0aGlzLm1ha2VDYXJkc0ltZ3MoKQogICAgdGhpcy5zZXRTdGF0ZSh7IGNhcmRJbWdzOiBhcnIgfSkKICB9CgoKICBjbGlja0hhbmRsZXIgPSAoZSkgPT4gewogICAgY29uc3QgbmFtZSA9IGUudGFyZ2V0LmFsdAogICAgY29uc3QgaW1nMSA9IHRoaXMuc3RhdGUuaW1nMQogICAgY29uc3QgaW1nMU5hbWUgPSB0aGlzLnN0YXRlLmltZzFOYW1lCiAgICBjb25zdCBiYWNrID0gImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9DNFEvQUNfNF9XZWIvbWFzdGVyL3VuaXRzL3JlYWN0L2V4ZXJjaXNlcy9vYmplY3RzX2FuZF9hcnJheXMvY2FyZHMvYmFjay5wbmciCiAgICBpZiAodGhpcy5mbGlwcGVkKSB7CiAgICAgIHJldHVybgogICAgfQoKICAgIHRoaXMuc2V0U3RhdGUoeyBjdXJyZW50Q2FyZDogZS50YXJnZXQgfSkKICAgIGlmICghaW1nMSkgewogICAgICB0aGlzLnNldFN0YXRlKHsgaW1nMU5hbWU6IG5hbWUsIGltZzE6IGUudGFyZ2V0IH0pCiAgICAgIGNvbnNvbGUubG9nKGUudGFyZ2V0KQoKICAgIH0gZWxzZSB7CiAgICAgIGlmKG5hbWUgPT09IGltZzFOYW1lKXsKICAgICAgICByZXR1cm4KICAgICAgfQogICAgICB0aGlzLmZsaXBwZWQgPSB0cnVlCiAgICAgIGlmIChpbWcxTmFtZS5zbGljZSgwLCAtMSkgPT09IG5hbWUuc2xpY2UoMCwgLTEpICYmIGltZzFOYW1lICE9PSBuYW1lKSB7CiAgICAgICAgdGhpcy5zZXRTdGF0ZSh7IGltZzE6ICIiLCBpbWcxTmFtZTogIiIsIGN1cnJlbnRDYXJkOiAiIiB9KQogICAgICAgIHRoaXMuZmxpcHBlZCA9IGZhbHNlCiAgICAgIH0gZWxzZSB7CiAgICAgICAgc2V0VGltZW91dCgoZSkgPT4gewogICAgICAgICAgdGhpcy5zdGF0ZS5pbWcxLnNyYyA9IGJhY2s7CiAgICAgICAgICB0aGlzLnN0YXRlLmN1cnJlbnRDYXJkLnNyYyA9IGJhY2s7CiAgICAgICAgICB0aGlzLnNldFN0YXRlKHsgaW1nMTogIiIsIGltZzFOYW1lOiAiIiwgY3VycmVudENhcmQ6ICIiIH0pOwogICAgICAgICAgLy9naXZlcyB0aGUgb2theSB0byBmbGlwIGEgbmV3IGNhcmQKICAgICAgICAgIHRoaXMuZmxpcHBlZCA9IGZhbHNlCiAgICAgICAgfSwgNTAwKQogICAgICB9IAogICAgfQoKICAgIAogICAgZS50YXJnZXQuc3JjID0gJ2h0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9DNFEvQUNfNF9XZWIvbWFzdGVyL3VuaXRzL3JlYWN0L2V4ZXJjaXNlcy9vYmplY3RzX2FuZF9hcnJheXMvY2FyZHMvJyArIG5hbWUuc2xpY2UoMCwgLTEpICsgJy5wbmcnCiAgfQoKCiAgcmVuZGVyID0gKCkgPT4gewogICAgcmV0dXJuICgKICAgICAgPGRpdj4KICAgICAgICA8ZGl2IGNsYXNzTmFtZT0iaW1nLWNvbnRhaW5lciI+CiAgICAgICAgICB7dGhpcy5zdGF0ZS5jYXJkSW1nc30KICAgICAgICA8L2Rpdj4KICAgICAgPC9kaXY+CiAgICApCiAgfQp9CgpSZWFjdERPTS5yZW5kZXIoPEFwcCAvPiwgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ3Jvb3QnKSk7Cg=='),
           (6, 2, 'matrix.js', 'JavaScript', 'CnZhciBtYXRyaXggPSBbXSwKICAgIEggPSA0LCAvLyA0IHJvd3MKICAgIFcgPSA2OyAvLyBvZiA2IGNlbGxzCgpmb3IgKCB2YXIgeSA9IDA7IHkgPCBIOyB5KysgKSB7CiAgICBtYXRyaXhbIHkgXSA9IFtdOwogICAgZm9yICggdmFyIHggPSAwOyB4IDwgVzsgeCsrICkgewogICAgICAgIG1hdHJpeFsgeSBdWyB4IF0gPSAiZm9vIjsKICAgIH0KfQpjb25zb2xlLmxvZyggbWF0cml4ICk='),
           (6, 5, 'matrix.js', 'JavaScript', 'CnZhciBtYXRyaXggPSBbXSwKICAgIEggPSA0LCAvLyA0IHJvd3MKICAgIFcgPSA2OyAvLyBvZiA2IGNlbGxzCgpmb3IgKCB2YXIgeSA9IDA7IHkgPCBIOyB5KysgKSB7CiAgICBtYXRyaXhbIHkgXSA9IFtdOwogICAgZm9yICggdmFyIHggPSAwOyB4IDwgVzsgeCsrICkgewogICAgICAgIG1hdHJpeFsgeSBdWyB4IF0gPSAiZm9vIjsKICAgIH0KfQpjb25zb2xlLmxvZyggbWF0cml4ICkKY29uc29sZS5sb2coIG1hdHJpeFswXVswXSAp'),
           (7, 3, 'binding.js', 'JavaScript', 'dGhpcy5uYW1lID0gIkpvaG4iCgp2YXIgbXlOYW1lID0gewogIG5hbWU6ICJUb20iLAogIGdldE5hbWU6IGZ1bmN0aW9uKCkgewogICAgcmV0dXJuIHRoaXMubmFtZQogIH0KfQoKdmFyIHN0b3JlTXlOYW1lID0gbXlOYW1lLmdldE5hbWU7IC8vIGV4YW1wbGUgMQp2YXIgc3RvcmVNeU5hbWUyID0gbXlOYW1lLmdldE5hbWUuYmluZChteU5hbWUpOyAvLyBleGFtcGxlIDIKdmFyIHN0b3JlTXlOYW1lMyA9IG15TmFtZS5nZXROYW1lKCk7IC8vIGV4YW1wbGUgMwoKY29uc29sZS5sb2coImV4YW1wbGUgMTogIiArIHN0b3JlTXlOYW1lKCkpOyAvLyBkb2Vzbid0IHdvcmsKY29uc29sZS5sb2coImV4YW1wbGUgMjogIiArIHN0b3JlTXlOYW1lMigpKTsgLy8gd29ya3MKY29uc29sZS5sb2coImV4YW1wbGUgMzogIiArIHN0b3JlTXlOYW1lMyk7IC8vIHdvcmtz=='),
           (3, 3, 'style.css', 'CSS', 'Ym9keXsKCWJhY2tncm91bmQtY29sb3I6ICMyMjI7Cgljb2xvcjojZGRkOwoJZm9udC1mYW1pbHk6IEFkYW07CglsaW5lLWhlaWdodDogMS41Owp9CgpoMXsKCWJhY2tncm91bmQtY29sb3I6ICNkZGQ7Cglmb250LXNpemU6IDYwcHg7Cgljb2xvcjogIzIyMjsKCXRleHQtYWxpZ246IGNlbnRlcjsKCW1hcmdpbjogLThweDsKfQoKLnBhZ2V7CgltYXJnaW46IDUlIDIwJTsKfQoKaDJ7Cglmb250LXNpemU6IDQwcHg7Cgl0ZXh0LWFsaWduOiBjZW50ZXI7CglkaXNwbGF5OiBpbmxpbmUtYmxvY2s7Cn0KCi5wb3N0ewoJY29sb3I6ICNiYmI7Cglmb250LXNpemU6IDIwcHg7CglwYWRkaW5nOiAwIDIlOwp9CgouZGF0ZXsKCW1hcmdpbi1sZWZ0OiA3MCU7Cglmb250LXNpemU6IDIwcHg7Cn0KCmhyewoJd2lkdGg6IDUwJTsKCWJvcmRlcjogMDsKICAgIGhlaWdodDogMnB4OwogICAgYmFja2dyb3VuZC1pbWFnZTogbGluZWFyLWdyYWRpZW50KHRvIHJpZ2h0LCByZ2JhKDI1NSwgMjU1LCAyNTUsIDApLCByZ2JhKDI1NSwgMjU1LCAyNTUsIDAuNzUpLCByZ2JhKDI1NSwgMjU1LCAyNTUsIDApKTsKfQ=='),
           (8, 5, 'server.js', 'JavaScript', 'aW1wb3J0IFJlYWN0IGZyb20gJ3JlYWN0JzsKaW1wb3J0IFJlYWN0RE9NIGZyb20gJ3JlYWN0LWRvbSc7CmltcG9ydCB7QnJvd3NlclJvdXRlcn0gZnJvbSAncmVhY3Qtcm91dGVyLWRvbSc7CmltcG9ydCAnLi9pbmRleC5jc3MnOwppbXBvcnQgQXBwIGZyb20gJy4vQXBwJzsKaW1wb3J0IHJlZ2lzdGVyU2VydmljZVdvcmtlciBmcm9tICcuL3JlZ2lzdGVyU2VydmljZVdvcmtlcic7CgpSZWFjdERPTS5yZW5kZXIoCiAgICA8QnJvd3NlclJvdXRlcj4KICAgIDxBcHAvPgogICAgPC9Ccm93c2VyUm91dGVyPiwgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ3Jvb3QnKSk7CnJlZ2lzdGVyU2VydmljZVdvcmtlcigpOw=='),
           (8, 5, 'express.js', 'JavaScript', 'aW1wb3J0IFJlYWN0IGZyb20gJ3JlYWN0JzsKaW1wb3J0IFJlYWN0RE9NIGZyb20gJ3JlYWN0LWRvbSc7CmltcG9ydCB7QnJvd3NlclJvdXRlcn0gZnJvbSAncmVhY3Qtcm91dGVyLWRvbSc7CmltcG9ydCAnLi9pbmRleC5jc3MnOwppbXBvcnQgQXBwIGZyb20gJy4vQXBwJzsKaW1wb3J0IHJlZ2lzdGVyU2VydmljZVdvcmtlciBmcm9tICcuL3JlZ2lzdGVyU2VydmljZVdvcmtlcic7CgpSZWFjdERPTS5yZW5kZXIoCiAgICA8QnJvd3NlclJvdXRlcj4KICAgIDxBcHAvPgogICAgPC9Ccm93c2VyUm91dGVyPiwgZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ3Jvb3QnKSk7CnJlZ2lzdGVyU2VydmljZVdvcmtlcigpOw=='),
           (7, 5, 'binding.js', 'JavaScript', 'dGhpcy5uYW1lID0gIkpvaG4iCgp2YXIgbXlOYW1lID0gewogIG5hbWU6ICJUb20iLAogIGdldE5hbWU6IGZ1bmN0aW9uKCkgewogICAgcmV0dXJuIHRoaXMubmFtZQogIH0KfQoKdmFyIHN0b3JlTXlOYW1lID0gbXlOYW1lLmdldE5hbWU7IC8vIGV4YW1wbGUgMQp2YXIgc3RvcmVNeU5hbWUyID0gbXlOYW1lLmdldE5hbWUuYmluZChteU5hbWUpOyAvLyBleGFtcGxlIDIKdmFyIHN0b3JlTXlOYW1lMyA9IG15TmFtZS5nZXROYW1lKCk7IC8vIGV4YW1wbGUgMwoKY29uc29sZS5sb2coImV4YW1wbGUgMTogIiArIHN0b3JlTXlOYW1lKCkpOyAvLyBkb2Vzbid0IHdvcmsKY29uc29sZS5sb2coImV4YW1wbGUgMjogIiArIHN0b3JlTXlOYW1lMigpKTsgLy8gd29ya3MKY29uc29sZS5sb2coImV4YW1wbGUgMzogIiArIHN0b3JlTXlOYW1lMyk7IC8vIHdvcmtz==');

INSERT INTO problems (ticketID, problem_description)
    VALUES (1, 'Ive been working on this for 3 years, I think I might be dumb T_T'),
           (2, 'I really need this to work, this assignment is due next week and I dont know how to get this to work!!!'),
           (3, 'Isnt it supposed to wrap on its own?'),
           (4, 'The components work in their respective files but when importing them Im getting an error.'),
           (5, 'I dont get why this doesnt work!'),
           (6, 'I know how to make matrises (O.o) but I dont know how to recieve the data conventionally.'),
           (7, 'I just dont get it. Can one of you beautiful amazing, kind people explain to me why JavaScript bind() is necessary for this code to work?'),
           (8, 'The goal is to have each server holding its own data while the data is sourcing from the same point.');

INSERT INTO solutions (ticketID, solution_userID,  solution_description, postDate)
    VALUES (2, 2, 'Your issue was that all your routes were rending through "exact path", so any extensions of those routes would not match the path.', '3/21/18'),
           (3, 2, 'To break the h3 tag you can use "word-break: break-word;".', '3/22/18'),
           (1, 4, 'First, youre not dumb, The only problen was that you were referencing the "cardImgs" but in the state the value was "cardImg."', '3/23/18'),
           (6, 5, 'Heres an example of how you can access data within the matrix.', '3/26/18'),
           (3, 3, 'You can set the display to inline-block.', '3/29/18'),
           (7, 5, 'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind', '3/30/18');

INSERT INTO comments (ticketID, commenter_id, comment, commentDate)
VALUES (1, 2, 'this is common problem among new devs, recursion is hard', '12/10/2018'),
        (4, 3, 'loops are very difficult', '12/05/2019'),
        (3, 4, 'next time phrase your question like this', '09/20/2018');
